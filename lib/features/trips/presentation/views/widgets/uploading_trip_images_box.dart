import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/models/picked_image_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dotted_box.dart';
import '../../../../../core/widgets/empty_grid_widget.dart';
import '../../manager/trips_provider.dart';

class UploadingTripImagesBox extends StatelessWidget {
  const UploadingTripImagesBox({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.read<TripsProvider>();
    return SizedBox(
      width: 600,
      height: 400,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomDottedBox(
              child: prov.tripImages.isNotEmpty
                  ? UploadedImagesGrid(images: prov.tripImages)
                  : EmptyGridWidget(
                      repeat: false,
                      message: 'قم بإضافة صور للرحلة',
                    ),
            ),
          ),

          Positioned(
            bottom: 12,
            right: 12,
            child: CustomCircularButton(
              icon: Icons.add,
              borderSide: BorderSide.none,
              backgroundColor: AppColors.lightGreen,
              onPressed: () {
                prov.addTripImages();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UploadedImagesGrid extends StatelessWidget {
  const UploadedImagesGrid({super.key, required this.images});
  final List<PickedImage> images;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var crossAxisCount = (width / 120).toInt();
        return GridView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: max(crossAxisCount, 1),
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 1,
            mainAxisExtent: 120,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return _FileImage(
              image: images[index],
              onDelete: () {
                context.read<TripsProvider>().removeImageFromUploadedList(
                  images[index],
                );
              },
            );
          },
        );
      },
    );
  }
}

class _FileImage extends StatelessWidget {
  const _FileImage({required this.onDelete, required this.image});
  final VoidCallback onDelete;
  final PickedImage image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: MemoryImage(image.bytes),
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
