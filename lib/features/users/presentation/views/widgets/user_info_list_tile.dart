import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('محمد خالد محمود', style: AppTextStyles.bold22(context)),
      subtitle: Text('+20109876543', style: AppTextStyles.regular16(context)),
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(Assets.imagesTestUser),
      ),
    );
  }
}
