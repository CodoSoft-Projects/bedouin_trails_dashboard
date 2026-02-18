import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../manager/ads_provider.dart';
import 'widgets/ads_items_section.dart';
import 'widgets/article_form_section.dart';
import 'widgets/no_ads_section.dart';

class AdsView extends StatefulWidget {
  const AdsView({super.key});
  static const String routeName = '/ads-view';

  @override
  State<AdsView> createState() => _AdsViewState();
}

class _AdsViewState extends State<AdsView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      context.read<AdsProvider>().getAllAds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'إدارة الاعلانات'),
      body: const AdsViewBody(),
    );
  }
}

class AdsViewBody extends StatelessWidget {
  const AdsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<AdsProvider>();
    if (prov.checkGettingAds == false) {
      return ApiErrorView(msg: prov.message, onRetry: prov.getAllAds);
    }
    if (prov.adsItems.isEmpty && prov.checkGettingAds == true) {
      return const NoAdsSection();
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: AdsItemsSection()),
          Expanded(flex: 5, child: ArticleFormSection()),
        ],
      ),
    );
  }
}
