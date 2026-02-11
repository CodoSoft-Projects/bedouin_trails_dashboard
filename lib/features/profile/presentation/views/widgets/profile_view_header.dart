import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../edit_profile_view.dart';
import 'change_password_dialog.dart';
import 'profile_image.dart';

class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({
    super.key,
    required this.title,
    this.showInProfile = true,
    this.onEditImage,
  });
  final String title;
  final bool showInProfile;
  final VoidCallback? onEditImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.sandyBrown,
                image: DecorationImage(
                  image: AssetImage(Assets.imagesProfileBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCircularButton(
                    icon: Icons.arrow_back_ios_new,
                    onPressed: () => Navigator.pop(context),
                    borderSide: BorderSide.none,
                  ),
                  Text(
                    title,
                    style: AppTextStyles.regular26(context).copyWith(
                      color: AppColors.white,
                      fontFamily: Constants.vexaFontFamily,
                    ),
                  ),
                  const Spacer(),
                  if (!showInProfile)
                    CustomButton(
                      text: "تغيير كلمة المرور",
                      color: AppColors.whiteGrey,
                      textColor: AppColors.sandyBrown,
                      onPressed: () => changePasswordDialog(context),
                    ),
                  if (showInProfile)
                    CustomButton(
                      text: 'تعديل بيانات الحساب',
                      color: AppColors.whiteGrey,
                      textColor: AppColors.sandyBrown,
                      onPressed: () {
                        Navigator.pushNamed(context, EditProfileView.routeName);
                      },
                    ),
                ],
              ),
            ),
          ),

          ProfileImage(canEdit: !showInProfile, onEdit: onEditImage),
        ],
      ),
    );
  }
}
