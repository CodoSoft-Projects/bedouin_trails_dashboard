// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_name_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../manager/profile_provider.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ProfileProvider>();
    return AbsorbPointer(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 16,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomNameField(
                      labelText: 'الإسم الأول',
                      controller: TextEditingController(
                        text: prov.fnameController.text,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomNameField(
                      labelText: 'الإسم الثاني',
                      controller: TextEditingController(
                        text: prov.lnameController.text,
                      ),
                    ),
                  ),
                ],
              ),

              CustomEmailField(
                labelText: 'البريد الإلكتروني',
                controller: TextEditingController(
                  text: prov.emailController.text,
                ),
              ),

              CustomPhoneTextField(
                labelText: 'رقم الجوال',
                controller: TextEditingController(
                  text: prov.phoneController.text,
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
