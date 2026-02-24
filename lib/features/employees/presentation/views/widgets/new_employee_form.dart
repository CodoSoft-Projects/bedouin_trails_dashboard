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
import '../../../../../generated/l10n.dart';
import '../../../../control_panel/presentation/manager/functions/get_data_method.dart';
import '../../../data/enums/filter_employee_type.dart';
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
                        labelText: S.of(context).firstName,
                        hintText: S.of(context).firstName,
                        controller: prov.fnameController,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomNameField(
                        labelText: S.of(context).lastName,
                        hintText: S.of(context).lastName,
                        controller: prov.lnameController,
                      ),
                    ),
                  ],
                ),

                CustomEmailField(
                  labelText: S.of(context).email,
                  hintText: S.of(context).email,
                  controller: prov.emailController,
                ),

                CustomPhoneTextField(
                  labelText: S.of(context).mobileNumber,
                  hintText: S.of(context).mobileNumber,
                  controller: prov.phoneController,
                ),

                CustomPasswordField(
                  labelText: S.of(context).password,
                  hintText: S.of(context).password,
                  controller: prov.passwordController,
                ),

                _Permissions(),

                const SizedBox(height: 16),
                CustomButton(
                  text: S.of(context).addNewEmployee,
                  horizontalPadding: 75,
                  color: AppColors.sandyBrown,
                  onPressed: () async {
                    if (prov.formKey.currentState!.validate()) {
                      if (prov.pickedImage == null) {
                        AppMessage.errorBar(
                          context,
                          message: S.of(context).imageRequired,
                        );
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
                S.of(context).jobRole,
                style: AppTextStyles.medium18(
                  context,
                ).copyWith(color: AppColors.blue),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LabeledCheckbox(
            labelText: FilterEmployeeType.manageTrips.label(context),
            value: prov.permissions.manageTrips,
            onChanged: (value) {
              prov.onChangePermission(manageTrips: value);
            },
          ),
          LabeledCheckbox(
            labelText: FilterEmployeeType.manageSuspendedTrips.label(context),
            value: prov.permissions.manageSuspendedTrips,
            onChanged: (value) {
              prov.onChangePermission(manageSuspendedTrips: value);
            },
          ),
          LabeledCheckbox(
            labelText: FilterEmployeeType.manageUsers.label(context),
            value: prov.permissions.manageUsers,
            onChanged: (value) {
              prov.onChangePermission(manageUsers: value);
            },
          ),
          LabeledCheckbox(
            labelText: FilterEmployeeType.manageBookingRequests.label(context),
            value: prov.permissions.manageBookingRequests,
            onChanged: (value) {
              prov.onChangePermission(manageBookingRequests: value);
            },
          ),
          LabeledCheckbox(
            labelText: FilterEmployeeType.manageWebsite.label(context),
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
