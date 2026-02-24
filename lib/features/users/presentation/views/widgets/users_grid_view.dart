import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/models/user_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/api_error_widget.dart';
import '../../../../../core/widgets/custom_person_card.dart';
import '../../../../../core/widgets/empty_grid_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/users_provider.dart';
import '../user_details_view.dart';

class UsersGridView extends StatelessWidget {
  const UsersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UsersProvider>();

    List<UserModel> loadingList = List.generate(
      8,
      (index) => UserModel.empty(),
    );

    List<UserModel> users = prov.checkGettingAllUser == null
        ? loadingList
        : prov.users;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var crossAxisCount = (width / 210).toInt();
          return prov.checkGettingAllUser == false
              ? ApiErrorView(msg: prov.message, onRetry: prov.getAllUsers)
              : users.isEmpty
              ? EmptyGridWidget(
                  lottie: Assets.animationsEmptyGrid2,
                  message: S.of(context).noUsers,
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
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return CustomPersonCard(
                        name: users[index].fullName,
                        phone: users[index].phone,
                        email: users[index].email,
                        imgUrl: users[index].image,
                        onTap: () {
                          prov.onSelectUser(users[index]);
                          Navigator.pushNamed(
                            context,
                            UserDetailsView.routeName,
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
