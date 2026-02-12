import 'dart:math';

import 'package:flutter/material.dart';

import 'ads_image.dart';

class AdsImagesGridView extends StatelessWidget {
  const AdsImagesGridView({
    super.key,
    this.canEdit = false,
    this.isLoading = false,
  });
  final bool canEdit;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var crossAxisCount = (width / 160).toInt();
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: max(crossAxisCount, 1),
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 1,
            mainAxisExtent: 160,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return AdsImage(canDelete: canEdit);
          },
        );
      },
    );
  }
}
