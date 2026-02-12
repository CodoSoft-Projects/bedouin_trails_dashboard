import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/show_ads_images_section.dart';
import 'widgets/update_ads_form_section.dart';

/// Ads is the nickname for Advertisement
class UpdateAdsView extends StatelessWidget {
  const UpdateAdsView({super.key});
  static const routeName = '/update-ads-view';

  @override
  Widget build(BuildContext context) {
    var isMobile = SizeConfig.isMobile();
    return Scaffold(
      appBar: customAppBar(context, title: 'تعديل إعلان الموقع'),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: isMobile ? const _Mobile() : const _Desktop(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: ShowAdsImagesSection(canEdit: true)),
        Expanded(child: UpdateAdsFormSection()),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: const [
        ShowAdsImagesSection(canEdit: true),
        UpdateAdsFormSection(),
      ],
    );
  }
}
