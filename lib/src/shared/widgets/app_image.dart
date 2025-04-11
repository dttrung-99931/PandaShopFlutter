// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class AppImage extends StatefulWidget {
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
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedImage(
      width: widget.width,
      height: widget.height,
      image: widget.image,
      fit: widget.fit,
      borderRadius: widget.borderRadius,
      shape: widget.shape,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return const SizedBox.expand();
          case LoadState.completed:
            return FadeTransition(
              opacity: _controller..forward(),
              child: ExtendedRawImage(
                image: state.extendedImageInfo?.image,
                fit: widget.fit,
                width: widget.width,
                height: widget.height,
              ),
            );
          case LoadState.failed:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
