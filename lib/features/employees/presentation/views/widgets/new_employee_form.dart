// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_name_field.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../../../core/widgets/labeled_checkbox.dart';
import '../../../../control_panel/presentation/manager/functions/get_data_method.dart';
import '../../manager/employees_provider.dart';

class NewEmployeeForm extends StatelessWidget {
  const NewEmployeeForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 555),

          child: Form(
            key: prov.formKey,
            child: Column(
              spacing: 16,
              children: [
                const SizedBox(height: 8),
                const _ProfileImage(),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CustomNameField(
                        labelText: 'الإسم الأول',
                        hintText: 'الإسم الأول',
                        controller: prov.fnameController,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomNameField(
                        labelText: 'الإسم الثاني',
                        hintText: 'الإسم الثاني',
                        controller: prov.lnameController,
                      ),
                    ),
                  ],
                ),

                CustomEmailField(
                  labelText: 'البريد الإلكتروني',
                  hintText: 'البريد الإلكتروني',
                  controller: prov.emailController,
                ),

                CustomPhoneTextField(
                  labelText: 'رقم الهاتف',
                  hintText: 'رقم الهاتف',
                  controller: prov.phoneController,
                ),

                CustomPasswordField(
                  labelText: 'كلمة المرور',
                  hintText: 'كلمة المرور',
                  controller: prov.passwordController,
                ),

                _Permissions(),

                const SizedBox(height: 16),
                CustomButton(
                  text: 'إضافة موظف',
                  horizontalPadding: 75,
                  color: AppColors.sandyBrown,
                  onPressed: () async {
                    if (prov.formKey.currentState!.validate()) {
                      if (prov.pickedImage == null) {
                        AppMessage.errorBar(context, message: 'الصورة مطلوبة');
                        return;
                      }

                      //* show loading dialog
                      loadingDialog(context);

                      await prov.addNewEmployee();

                      //* close loading dialog
                      Navigator.pop(context);

                      if (prov.checkAddingNewEmployee == true) {
                        //* Close add-employee-view
                        Navigator.pop(context);

                        getControlPanelData(context);
                        AppMessage.successBar(context, message: prov.message);
                      } else if (prov.checkAddingNewEmployee == false) {
                        AppMessage.errorBar(context, message: prov.message);
                      }
                    }
                  },
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              border: Border.all(color: AppColors.borderGrey, width: 2),
              image: prov.pickedImage == null
                  ? null
                  : DecorationImage(
                      image: MemoryImage(prov.pickedImage!.bytes),
                      fit: BoxFit.cover,
                    ),
            ),
            child: Visibility(
              visible: prov.pickedImage == null,
              child: Icon(LucideIcons.user, color: AppColors.sandyBrown),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 32,
            child: CustomCircularButton(
              icon: prov.pickedImage == null
                  ? LucideIcons.penLine
                  : LucideIcons.x,
              onPressed: () {
                (prov.pickedImage == null)
                    ? prov.onPickImage()
                    : prov.onClearImage();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Permissions extends StatelessWidget {
  const _Permissions();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    return CustomWhiteBox(
      color: AppColors.whiteGrey,
      child: Column(
        spacing: 8,
        children: [
          Row(
            children: [
              Text(
                'الدور الوظيفي',
                style: AppTextStyles.medium18(
                  context,
                ).copyWith(color: AppColors.blue),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LabeledCheckbox(
            labelText: 'إدارة الرحلات السياحية',
            value: prov.permissions.manageTrips,
            onChanged: (value) {
              prov.onChangePermission(manageTrips: value);
            },
          ),
          LabeledCheckbox(
            labelText: 'إدارة الرحلات الموقوفة',
            value: prov.permissions.manageSuspendedTrips,
            onChanged: (value) {
              prov.onChangePermission(manageSuspendedTrips: value);
            },
          ),
          LabeledCheckbox(
            labelText: 'إدارة المستخدمين',
            value: prov.permissions.manageUsers,
            onChanged: (value) {
              prov.onChangePermission(manageUsers: value);
            },
          ),
          LabeledCheckbox(
            labelText: 'إدارة طلبات الحجز',
            value: prov.permissions.manageBookingRequests,
            onChanged: (value) {
              prov.onChangePermission(manageBookingRequests: value);
            },
          ),
          LabeledCheckbox(
            labelText: 'إدارة الموقع الإلكتروني',
            value: prov.permissions.manageWebsite,
            onChanged: (value) {
              prov.onChangePermission(manageWebsite: value);
            },
          ),
        ],
      ),
    );
  }
}
