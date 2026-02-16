// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/employees_provider.dart';

class BlockEmployeeButton extends StatelessWidget {
  const BlockEmployeeButton({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    bool isActive = prov.selectedEmployee?.status == true;

    return CustomButton(
      text: !isActive ? 'الغاء حظر الموظف' : 'حظر الموظف',
      color: !isActive ? AppColors.cyanGreen : AppColors.red,
      onPressed: () {
        DialogHelper.showQuestionDialog(
          context,
          title: !isActive ? 'الغاء حظر الموظف' : 'حظر الموظف',
          desc: !isActive
              ? 'هل انت متاكد من الغاء حظر الموظف ؟'
              : 'هل انت متاكد من حظر الموظف ؟',
          onCancel: () {},
          onOk: () {
            _toggleAccount(context, prov: prov);
          },
        );
      },
    );
  }

  Future<void> _toggleAccount(
    BuildContext context, {
    required EmployeesProvider prov,
  }) async {
    //* show loading dialog
    loadingDialog(context);

    await prov.toggleAccountStatus();

    //* close loading dialog
    Navigator.pop(context);

    if (prov.checkUpdatingEmployee == true) {
      AppMessage.successBar(context, message: prov.message);
    } else if (prov.checkUpdatingEmployee == false) {
      AppMessage.errorBar(context, message: prov.message);
    }
  }
}
