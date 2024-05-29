// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:evievm_app/src/shared/dtos/image_dto.dart';

class ImageSlider extends StatelessWidget {
  final List<BaseImageDto> images;

  const ImageSlider({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: images.length,
      itemBuilder: ((context, index) {
        return AppImage(image: images[index]);
      }),
    );
  }
}

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.image,
    this.fit = BoxFit.scaleDown,
  });
  final BaseImageDto image;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage(
      image: image.imageProvider,
      fit: fit,
    );
  }
}
