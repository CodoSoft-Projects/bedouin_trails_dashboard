import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class UserRequestDetailsView extends StatelessWidget {
  const UserRequestDetailsView({super.key});
  static const routeName = '/user-request-details-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'طلب حجز الرحلة'),
      //
    );
  }
}
