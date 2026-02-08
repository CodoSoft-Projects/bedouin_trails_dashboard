import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class UpdateTripView extends StatelessWidget {
  const UpdateTripView({super.key});
  static const routeName = '/update-trip-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'تعديل تفاصيل الرحلة',
        showBack: true,
      ),
    );
  }
}
