// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/enums/order_status.dart';
import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../control_panel/presentation/manager/functions/get_data_method.dart';
import '../../../../trips/presentation/manager/trips_provider.dart';
import '../../manager/users_provider.dart';

class UserTripDetailsViewHeader extends StatelessWidget {
  const UserTripDetailsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    var orderId = prov.selectedTrip?.userOrder?.id ?? 0;
    var status = prov.selectedTrip?.userOrder?.status;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (status == OrderStatus.pending)
            CustomButton(
              text: S.of(context).completePayment,
              color: AppColors.whiteGrey,
              textColor: AppColors.black,
              onPressed: () {
                DialogHelper.showQuestionDialog(
                  context,
                  title: S.of(context).confirmPayment,
                  desc: S.of(context).confirmPaymentMessage,
                  btnOkText: S.of(context).yes,
                  btnCancelText: S.of(context).no,
                  onCancel: () {},
                  onOk: () {
                    _changeStatus(
                      context,
                      orderId: orderId,
                      status: OrderStatus.paid,
                    );
                  },
                );
              },
            ),

          // const Spacer(),
          if (status == OrderStatus.pending)
            CustomButton(
              text: S.of(context).rejectBooking,
              color: AppColors.whiteGrey,
              textColor: AppColors.black,
              onPressed: () {
                DialogHelper.showQuestionDialog(
                  context,
                  title: S.of(context).confirmReject,
                  desc: S.of(context).confirmRejectMessage,
                  btnOkText: S.of(context).yes,
                  btnCancelText: S.of(context).no,
                  onCancel: () {},
                  onOk: () {
                    _changeStatus(
                      context,
                      orderId: orderId,
                      status: OrderStatus.cancelled,
                    );
                  },
                );
              },
            ),

          // if the admin want to complete the order status from the trip details view, the order details view will be opened to show the complete order details and the complete/reject buttons, and if the admin want to complete/reject the order from the order details view, the trip details view will be opened without showing the complete/reject buttons
          if (status == OrderStatus.paid)
            CustomButton(
              text: S.of(context).confirmCompletion,
              color: AppColors.blue,
              onPressed: () {
                DialogHelper.showQuestionDialog(
                  context,
                  title: S.of(context).confirmCompletion,
                  desc: S.of(context).confirmCompleteMessage,
                  btnOkText: S.of(context).yes,
                  btnCancelText: S.of(context).no,
                  onCancel: () {},
                  onOk: () {
                    _changeStatus(
                      context,
                      orderId: orderId,
                      status: OrderStatus.accepted,
                    );
                  },
                );
              },
            ),
        ],
      ),
    );
  }

  Future<void> _changeStatus(
    BuildContext context, {
    required int orderId,
    required OrderStatus status,
  }) async {
    //* Show loading dialog
    loadingDialog(context);

    var userProv = context.read<UsersProvider>();
    await userProv.updateOrderStatus(id: orderId, status: status);

    //* Close loading dialog
    Navigator.pop(context);

    if (userProv.checkUpdatingOrderStatus == true) {
      //* close details view
      Navigator.pop(context);
      getControlPanelData(context);

      AppMessage.successBar(context, message: userProv.message);
    } else if (userProv.checkUpdatingOrderStatus == false) {
      AppMessage.errorBar(context, message: userProv.message);
    }
  }
}
