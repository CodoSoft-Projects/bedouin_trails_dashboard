import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/models/order_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/api_error_widget.dart';
import '../../../../../core/widgets/custom_person_card.dart';
import '../../../../../core/widgets/empty_grid_widget.dart';
import '../../../../trips/presentation/manager/trips_provider.dart';
import '../../manager/orders_provider.dart';
import '../order_details_view.dart';

class OrdersGridView extends StatelessWidget {
  const OrdersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<OrdersProvider>();

    List<OrderModel> loadingList = List.generate(
      8,
      (index) => OrderModel.empty(),
    );

    List<OrderModel> orders = prov.checkGettingAllUser == null
        ? loadingList
        : prov.orders;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var crossAxisCount = (width / 210).toInt();
          return prov.checkGettingAllUser == false
              ? ApiErrorView(msg: prov.message, onRetry: prov.getAllOrdersUsers)
              : orders.isEmpty
              ? EmptyGridWidget(
                  lottie: Assets.animationsEmptyGrid2,
                  message: 'لا يوجد مستخدمين',
                )
              : Skeletonizer(
                  enabled: prov.checkGettingAllUser == null,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: max(crossAxisCount, 1),
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 221 / 386,
                      mainAxisExtent: 386,
                    ),
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      var user = orders[index].user;
                      return CustomPersonCard(
                        name: user.fullName,
                        phone: user.phone,
                        email: user.email,
                        imgUrl: user.image,
                        onTap: () {
                          prov.onSelectUser(orders[index]);
                          context.read<TripsProvider>()
                            ..onSelectTrip(orders[index].trip)
                            ..getTripDetails();
                          Navigator.pushNamed(
                            context,
                            OrderDetailsView.routeName,
                          );
                        },
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
