// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/models/trip/trip_card_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../manager/trips_provider.dart';
import 'update_trip_program_cart_dialog.dart';

class TripProgramCartItem extends StatelessWidget {
  const TripProgramCartItem({
    super.key,
    this.canEdit = false,
    required this.cartItem,
    required this.cardNumber,
  });
  final bool canEdit;
  final TripCardModel cartItem;
  final int cardNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomWhiteBox(
            color: AppColors.whiteGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    CustomWhiteBox(
                      child: Text(
                        'البطاقة $cardNumber',
                        style: AppTextStyles.regular16(context),
                      ),
                    ),
                    const Spacer(),
                    if (canEdit) ...[
                      CustomCircularButton(
                        icon: LucideIcons.filePenLine,
                        borderSide: BorderSide.none,
                        size: 18,
                        onPressed: () {
                          context.read<TripsProvider>().fillCartControllers(
                            cartItem,
                          );
                          updateTripProgramCartDialog(
                            context,
                            cartIdx: cardNumber,
                            cart: cartItem,
                          );
                        },
                      ),
                      CustomCircularButton(
                        icon: LucideIcons.trash2,
                        borderSide: BorderSide.none,
                        size: 18,
                        onPressed: () {
                          DialogHelper.showQuestionDialog(
                            context,
                            title: 'تاكيد',
                            desc: 'هل تريد حذف البطاقة',
                            onCancel: () {},
                            onOk: () {
                              _deleteCart(context);
                            },
                          );
                        },
                      ),
                    ],
                  ],
                ),

                IntrinsicHeight(
                  child: Row(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CustomCachedNetworkImage(
                            fit: BoxFit.fill,
                            imgUrl: cartItem.image,
                          ),
                        ),
                      ),

                      Expanded(child: _CartInfo(cartItem)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _deleteCart(BuildContext context) async {
    var prov = context.read<TripsProvider>();
    //* show loading dialog
    loadingDialog(context);
    await prov.deleteCardOfTripDay(cartId: cartItem.id);
    //* close loading dialog
    Navigator.pop(context);
    if (prov.checkDeletingCart == true) {
      AppMessage.successBar(context, message: prov.message);
    } else if (prov.checkDeletingCart == false) {
      AppMessage.errorBar(context, message: prov.message);
    }
  }
}

class _CartInfo extends StatelessWidget {
  const _CartInfo(this.cartItem);
  final TripCardModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        _CartInfoItem(title: 'عنوان البطاقة :', subtitle: cartItem.title),
        _CartInfoItem(
          title: 'وصف برنامج البطاقة :',
          subtitle: cartItem.description,
        ),
      ],
    );
  }
}

class _CartInfoItem extends StatelessWidget {
  const _CartInfoItem({required this.title, required this.subtitle});
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.regular16(
            context,
          ).copyWith(color: AppColors.blue),
        ),
        Row(
          children: [
            Expanded(
              child: CustomWhiteBox(
                child: Text(subtitle, style: AppTextStyles.regular16(context)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
