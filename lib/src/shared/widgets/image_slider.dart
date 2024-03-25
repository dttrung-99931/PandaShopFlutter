// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:evievm_app/src/shared/dtos/image_dto.dart';

class ImageSlider extends StatelessWidget {
  final List<BaseImageDto> images;

  const ImageSlider({
    Key? key,
    required this.images,
  }) : super(key: key);

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
    Key? key,
    required this.image,
  }) : super(key: key);
  final BaseImageDto image;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage(image: image.imageProvider);
  }
}
