// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_name_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../manager/profile_provider.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key,});
  @override
  Widget build(BuildContext context) {
    var prov = context.read<ProfileProvider>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Form(
        key:  prov.formKey ,
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
                      controller: prov.fnameController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomNameField(
                      labelText: 'الإسم الثاني',
                      controller: prov.lnameController,
                    ),
                  ),
                ],
              ),
    
              CustomEmailField(
                labelText: 'البريد الإلكتروني',
                controller: prov.emailController,
              ),
    
              CustomPhoneTextField(
                labelText: 'رقم الجوال',
                controller: prov.phoneController,
              ),
    
              const SizedBox(height: 24),
                CustomButton(
                  text: 'حفظ التغييرات',
                  color: AppColors.sandyBrown,
                  horizontalPadding: 72,
                  onPressed: () async {
                    if (prov.formKey.currentState!.validate()) {
                      await prov.updateProfile();
                      prov.formKey.currentState!.reset();
    
                      if (prov.checkUpdateProfile == true) {
                        Navigator.pop(context);
                        AppMessage.successBar(context, message: prov.message);
                      } else if (prov.checkUpdateProfile == false) {
                        AppMessage.errorBar(context, message: prov.message);
                      }
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
