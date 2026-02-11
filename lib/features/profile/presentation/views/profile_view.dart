import 'package:flutter/material.dart';

import 'widgets/profile_form.dart';
import 'widgets/profile_view_header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'profileViewBody';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileViewHeader(title: 'بيانات الحساب', showInProfile: true),
              const SizedBox(height: 32),
              ProfileForm(canEdit: false),
            ],
          ),
        ),
      ),
    );
  }
}
