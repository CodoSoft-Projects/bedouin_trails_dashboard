import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_search_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/orders_provider.dart';
import 'filter_orders_button.dart';

class OrdersViewHeader extends StatelessWidget {
  const OrdersViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var mobile = SizeConfig.isMobile();
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      leadingWidth: 0,
      leading: const SizedBox(width: 0),
      backgroundColor: AppColors.white,
      flexibleSpace: Container(color: AppColors.white),
      toolbarHeight: 60,
      expandedHeight: 60,
      title: mobile ? const _Mobile() : const _Desktop(),
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        FilterOrdersButton(),
        const Spacer(),
        _OrdersSearchField(),
        const Spacer(),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        FilterOrdersButton(),
        Expanded(child: _OrdersSearchField()),
      ],
    );
  }
}

class _OrdersSearchField extends StatelessWidget {
  const _OrdersSearchField();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<OrdersProvider>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: CustomSearchField(
        hintText: S.of(context).search,
        controller: prov.searchController,
        onChanged: (value) {
          prov.getAllOrdersUsers();
        },
      ),
    );
  }
}
