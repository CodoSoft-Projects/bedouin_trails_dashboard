import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class RequestDetailsView extends StatelessWidget {
  const RequestDetailsView({super.key});
  static const routeName = 'RequestDetailsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'حجوزات الرحلة'),
      //
    );
  }
}
