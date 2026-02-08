import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dotted_box.dart';

class UploadingTripImagesBox extends StatelessWidget {
  const UploadingTripImagesBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 400,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomDottedBox(
              child: UploadedImagesGrid(),
              // child: Center(
              //   child: EmptyGridWidget(message: 'قم بإضافة صور للرحلة'),
              // ),
            ),
          ),

          Positioned(
            bottom: 12,
            right: 12,
            child: CustomCircularButton(
              icon: Icons.add,
              borderSide: BorderSide.none,
              backgroundColor: AppColors.lightGreen,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class UploadedImagesGrid extends StatelessWidget {
  const UploadedImagesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var crossAxisCount = (width / 100).toInt();
        return GridView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: max(crossAxisCount, 1),
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 1,
            mainAxisExtent: 100,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return _FileImage(onDelete: () {});
          },
        );
      },
    );
  }
}

class _FileImage extends StatelessWidget {
  const _FileImage({required this.onDelete});
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(Assets.imagesTestTripImage),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: onDelete,
        child: CircleAvatar(
          backgroundColor: AppColors.red,
          radius: 10,
          child: Icon(Icons.close, color: AppColors.white, size: 16),
        ),
      ),
    );
  }
}
