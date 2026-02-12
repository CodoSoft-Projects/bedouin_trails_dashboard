import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

/// Ads is the nickname for Advertisement
class AdsView extends StatelessWidget {
  const AdsView({super.key});
  static const routeName = '/ads-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'إدارة إعلان الموقع'),
      // body: ,
    );
  }
}
