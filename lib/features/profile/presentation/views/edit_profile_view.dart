import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_progress_hud.dart';
import '../manager/profile_provider.dart';
import 'widgets/edit_profile_form.dart';
import 'widgets/profile_view_header.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});
  static const routeName = 'edit-profile-view';

  @override
  Widget build(BuildContext context) {
    return CustomProgressHud(
      isLoading: context.watch<ProfileProvider>().checkUpdateProfile == null,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileViewHeader(
                title: S.of(context).editAccountData,
                showInProfile: false,
              ),
              const SizedBox(height: 32),
              EditProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
