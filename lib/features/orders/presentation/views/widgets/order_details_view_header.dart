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
import '../../manager/orders_provider.dart';

class OrderDetailsViewHeader extends StatelessWidget {
  const OrderDetailsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<OrdersProvider>();
    var orderId = prov.selectedOrder?.id ?? 0;
    bool visible = prov.selectedOrder?.status == OrderStatus.pending;
    return Visibility.maintain(
      visible: visible,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            CustomButton(
              text: S.of(context).completePayment,
              color: AppColors.cyanGreen,
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
                      status: OrderStatus.payed,
                    );
                  },
                );
              },
            ),
            const Spacer(),
            CustomButton(
              text: S.of(context).rejectBooking,
              color: AppColors.red,
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
          ],
        ),
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

    var orderProv = context.read<OrdersProvider>();
    await orderProv.updateOrderStatus(id: orderId, status: status);

    //* Close loading dialog
    Navigator.pop(context);

    if (orderProv.checkUpdatingOrderStatus == true) {
      //* close details view
      Navigator.pop(context);
      getControlPanelData(context);

      AppMessage.successBar(context, message: orderProv.message);
    } else if (orderProv.checkUpdatingOrderStatus == false) {
      AppMessage.errorBar(context, message: orderProv.message);
    }
  }
}
