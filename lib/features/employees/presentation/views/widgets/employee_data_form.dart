// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_name_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../../../core/widgets/labeled_checkbox.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/enums/filter_employee_type.dart';
import '../../manager/employees_provider.dart';

class EmployeeDataForm extends StatelessWidget {
  const EmployeeDataForm({super.key, required this.canEdit});
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AbsorbPointer(
        absorbing: !canEdit,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 555),

            child: Form(
              key: canEdit ? prov.formKey : null,
              child: Column(
                spacing: 16,
                children: [
                  const SizedBox(height: 8),
                  _ProfileImage(canEdit: canEdit),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: CustomNameField(
                          labelText: S.of(context).firstName,
                          controller: canEdit
                              ? prov.fnameController
                              : TextEditingController(
                                  text: prov.fnameController.text,
                                ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomNameField(
                          labelText: S.of(context).lastName,
                          controller: canEdit
                              ? prov.lnameController
                              : TextEditingController(
                                  text: prov.lnameController.text,
                                ),
                        ),
                      ),
                    ],
                  ),

                  CustomEmailField(
                    labelText: S.of(context).email,
                    controller: canEdit
                        ? prov.emailController
                        : TextEditingController(
                            text: prov.emailController.text,
                          ),
                  ),

                  CustomPhoneTextField(
                    labelText: S.of(context).mobileNumber,
                    controller: canEdit
                        ? prov.phoneController
                        : TextEditingController(
                            text: prov.phoneController.text,
                          ),
                  ),

                  // CustomPasswordField(
                  //   labelText: 'كلمة المرور',
                  //   controller: TextEditingController(text: "12345678"),
                  // ),
                  const _Permissions(),
                  if (canEdit) ...[
                    const SizedBox(height: 16),
                    CustomButton(
                      text: S.of(context).saveChanges,
                      horizontalPadding: 75,
                      color: AppColors.sandyBrown,
                      onPressed: () async {
                        if (prov.formKey.currentState!.validate()) {
                          //* show loading dialog
                          loadingDialog(context);

                          await prov.updateEmployeeData();

                          //* close loading dialog
                          Navigator.pop(context);

                          if (prov.checkUpdatingEmployee == true) {
                            AppMessage.successBar(
                              context,
                              message: prov.message,
                            );
                          } else if (prov.checkUpdatingEmployee == false) {
                            AppMessage.errorBar(context, message: prov.message);
                          }
                        }
                      },
                    ),
                  ],
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({required this.canEdit});
  final bool canEdit;
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
              image: DecorationImage(
                image: prov.pickedImage == null || canEdit == false
                    ? customCachedNetworkImageprovider(
                        prov.selectedEmployee?.image,
                      )
                    : MemoryImage(prov.pickedImage!.bytes),
                fit: BoxFit.cover,
              ),
            ),
            child: Visibility(
              visible: prov.pickedImage == null,
              child: Icon(LucideIcons.user, color: AppColors.sandyBrown),
            ),
          ),

          Visibility(
            visible: canEdit,
            child: Positioned(
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
