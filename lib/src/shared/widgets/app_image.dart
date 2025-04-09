// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/extensions/skeleton_extension.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage(
    this.image, {
    this.fit = BoxFit.scaleDown,
    this.width,
    this.height,
    super.key,
  });

  factory AppImage.network(
    String url, {
    BoxFit fit = BoxFit.scaleDown,
    double? width,
    double? height,
  }) {
    return AppImage(
      NetworkImage(url),
      fit: fit,
      width: width,
      height: height,
    );
  }

  final BoxFit fit;
  final double? height;
  final ImageProvider image;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage(
      width: width,
      height: height,
      image: image,
      fit: fit,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return const SizedBox.expand().skeleton(true, context);
          case LoadState.completed:
            return null; // Use the default image rendering
          case LoadState.failed:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
