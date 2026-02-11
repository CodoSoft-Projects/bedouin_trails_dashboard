import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/user_info_section.dart';

class UserRequestDetailsView extends StatelessWidget {
  const UserRequestDetailsView({super.key});
  static const routeName = '/user-request-details-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'طلب حجز الرحلة'),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                spacing: 12,
                children: [
                  Expanded(child: UserInfoSection()),
                  Expanded(child: SizedBox()),
                  // Expanded(child: RequestTripInfoSection()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
