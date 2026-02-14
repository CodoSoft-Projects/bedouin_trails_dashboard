import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../trips/presentation/views/widgets/show_trip_images_section.dart';
import '../../../../trips/presentation/views/widgets/show_trip_info_section.dart';

class RequestTripInfoSection extends StatelessWidget {
  const RequestTripInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var isMobile = SizeConfig.isMobile();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const SizedBox(height: 12),
          isMobile ? const _Mobile() : const _Desktop(),
          const SizedBox(height: 12),
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
        Expanded(child: ShowTripImagesSection(
          galleries: [],
        )),
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
