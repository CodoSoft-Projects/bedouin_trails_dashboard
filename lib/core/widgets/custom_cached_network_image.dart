import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../utils/app_colors.dart';
import 'image_loading_failed.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    this.imgUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });
  final String? imgUrl;
  final double? height, width;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl ?? "",
      height: height,
      width: width,
      fit: fit,
      errorWidget: ((context, error, stackTrace) => const ImageLoadingFailed()),
      placeholder: (context, url) => Skeletonizer(
        child: Container(
          height: height,
          width: width,
          // ignore: deprecated_member_use
          color: AppColors.sandyBrown.withOpacity(0.1),
        ),
      ),
    );
  }
}

CachedNetworkImageProvider customCachedNetworkImageprovider(String? imgPath) {
  return CachedNetworkImageProvider(
    imgPath ?? "",
    errorListener: (_) => const ImageLoadingFailed(),
  );
}

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({
    super.key,
    this.imgUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });
  final String? imgUrl;
  final double? height, width;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgUrl ?? "",
      height: height,
      width: width,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Skeletonizer(
          child: Container(
            height: height,
            width: width,
            // ignore: deprecated_member_use
            color: AppColors.sandyBrown.withOpacity(0.1),
          ),
        );
      },
      errorBuilder: ((context, error, stackTrace) =>
          const ImageLoadingFailed()),
    );
  }
}

ImageProvider imageProviderNetwork(String? imgUrl) {
  return NetworkImage(imgUrl ?? "", headers: {"Accept": "image/*"});
}
