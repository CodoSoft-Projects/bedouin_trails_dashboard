import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/user_info_section.dart';
import 'widgets/user_trip_request_details_section.dart';

class UserRequestDetailsView extends StatelessWidget {
  const UserRequestDetailsView({super.key});
  static const routeName = '/user-request-details-view';

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var isMobile = SizeConfig.isMobile();
    return Scaffold(
      appBar: customAppBar(context, title: 'طلب حجز الرحلة'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 12),
              isMobile ? const _Mobile() : const _Desktop(),
              const SizedBox(height: 12),
            ],
          ),
        ),
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
        Expanded(child: UserInfoSection()),
        Expanded(child: UserTripRequestDetailsSection()),
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
      children: [UserInfoSection(), UserTripRequestDetailsSection()],
    );
  }
}
