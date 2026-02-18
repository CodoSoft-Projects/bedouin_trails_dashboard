import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../manager/about_us_provider.dart';
import 'widgets/about_us_form_section.dart';
import 'widgets/about_us_section.dart';
import 'widgets/no_about_us_section.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});
  static const String routeName = '/about-us-view';

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      context.read<AboutUsProvider>().getAllItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'إدارة صفحة من نحن'),
      body: const AboutUsViewBody(),
    );
  }
}

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<AboutUsProvider>();
    if (prov.checkGettingItems == false) {
      return ApiErrorView(msg: prov.message, onRetry: prov.getAllItems);
    }
    if (prov.items.isEmpty && prov.checkGettingItems == true) {
      return const NoAboutUsSection();
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: AboutUsSection()),
          Expanded(flex: 5, child: AboutUsFormSection()),
        ],
      ),
    );
  }
}
