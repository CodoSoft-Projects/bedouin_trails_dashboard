import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_cached_network_image.dart';
import 'custom_white_box.dart';

class CustomPersonCard extends StatelessWidget {
  const CustomPersonCard({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    this.imgUrl,
    this.onTap,
  });
  final String name, phone, email;
  final String? imgUrl;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: AppColors.whiteGrey,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: AppColors.sandyBrown.withOpacity(0.5),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          spacing: 8,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    image: customCachedNetworkImageprovider(imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium18(context),
            ),
            Text(
              phone,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium18(context),
            ),

            CustomWhiteBox(
              vPadding: 8,
              child: Text(
                email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.medium18(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
