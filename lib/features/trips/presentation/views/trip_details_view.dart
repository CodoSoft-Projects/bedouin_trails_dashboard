import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({super.key});
  static const routeName = '/trip-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'تفاصيل الرحلة', showBack: true),
    );
  }
}
