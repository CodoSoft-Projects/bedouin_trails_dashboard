import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/show_trip_images_section.dart';
import 'widgets/show_trip_info_section.dart';
import 'widgets/suspended_trip_details_view_header.dart';

class SuspendedTripDetailsView extends StatelessWidget {
  const SuspendedTripDetailsView({super.key});
  static const routeName = '/suspended-trip-details';

  @override
  Widget build(BuildContext context) {
    var isMobile = SizeConfig.isMobile();
    return Scaffold(
      appBar: customAppBar(context, title: 'تفاصيل الرحلة', showBack: true),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          const SuspendedTripDetailsViewHeader(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: isMobile ? const _Mobile() : const _Desktop(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
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
        Expanded(child: ShowTripImagesSection(galleries: [])),
        Expanded(child: ShowTripInfoSection()),
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
      children: [
        ShowTripImagesSection(galleries: []),
        ShowTripInfoSection(),
      ],
    );
  }
}
