import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/user_info_list_tile.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key});
  static const routeName = '/user-details-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, titleWidgt: const UserInfoListTile()),
    );
  }
}
