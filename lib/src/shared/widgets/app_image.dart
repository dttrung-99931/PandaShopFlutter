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
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    super.key,
  });

  factory AppImage.network(
    String url, {
    BoxFit fit = BoxFit.scaleDown,
    double? width,
    double? height,
    BorderRadius? borderRadius,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return AppImage(
      ExtendedNetworkImageProvider(url),
      fit: fit,
      width: width,
      height: height,
      borderRadius: borderRadius,
      shape: shape,
    );
  }

  final BoxFit fit;
  final double? height;
  final ImageProvider image;
  final double? width;
  final BorderRadius? borderRadius;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage(
      width: width,
      height: height,
      image: image,
      fit: fit,
      borderRadius: borderRadius,
      shape: shape,
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
