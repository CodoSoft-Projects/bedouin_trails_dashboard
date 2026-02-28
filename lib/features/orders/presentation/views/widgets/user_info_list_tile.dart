import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/models/user_model.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../manager/orders_provider.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<OrdersProvider>();
    var user = prov.selectedOrder?.user ?? UserModel.empty();
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(user.fullName, style: AppTextStyles.bold22(context)),
      subtitle: Text(user.email, style: AppTextStyles.regular16(context)),
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: customCachedNetworkImageprovider(user.image),
      ),
    );
  }
}
