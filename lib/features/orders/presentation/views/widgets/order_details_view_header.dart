// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/enums/order_status.dart';
import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
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
              text: 'إتمام دفع الحجز',
              color: AppColors.cyanGreen,
              onPressed: () {
                DialogHelper.showQuestionDialog(
                  context,
                  title: 'تأكيد إتمام الدفع',
                  desc: 'هل أنت متأكد من إتمام دفع الحجز؟',
                  btnOkText: 'نعم',
                  btnCancelText: 'لا',
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
              text: 'رفض طلب الحجز',
              color: AppColors.red,
              onPressed: () {
                DialogHelper.showQuestionDialog(
                  context,
                  title: 'تأكيد رفض الحجز',
                  desc: 'هل أنت متأكد من رفض طلب الحجز؟',
                  btnOkText: 'نعم',
                  btnCancelText: 'لا',
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

      AppMessage.successBar(context, message: orderProv.message);
    } else if (orderProv.checkUpdatingOrderStatus == false) {
      AppMessage.errorBar(context, message: orderProv.message);
    }
  }
}
