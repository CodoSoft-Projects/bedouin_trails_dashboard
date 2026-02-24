import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../trips/presentation/views/widgets/show_trip_images_section.dart';
import 'widgets/user_trip_details_view_header.dart';
import 'widgets/user_trip_info_section.dart';

class UserTripDetailsView extends StatelessWidget {
  const UserTripDetailsView({super.key});
  static const routeName = '/user-trip-details';

  @override
  Widget build(BuildContext context) {
    var isMobile = SizeConfig.isMobile();
    return Scaffold(
      appBar: customAppBar(
        context,
        title: S.of(context).tripDetails,
        showBack: true,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          const SliverToBoxAdapter(child: UserTripDetailsViewHeader()),
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
        Expanded(child: ShowTripImagesSection()),
        Expanded(child: UserTripInfoSection()),
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
      children: [ShowTripImagesSection(), UserTripInfoSection()],
    );
  }
}
