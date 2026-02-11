import 'package:flutter/material.dart';

import 'widgets/profile_form.dart';
import 'widgets/profile_view_header.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});
  static const routeName = 'edit-profile-view';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileViewHeader(
                title: 'تعديل بيانات الحساب',
                showInProfile: false,
              ),
              const SizedBox(height: 32),
              ProfileForm(canEdit: true),
            ],
          ),
        ),
      ),
    );
  }
}
