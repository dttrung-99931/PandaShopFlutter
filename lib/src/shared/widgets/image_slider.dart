// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/shared/dtos/image_dto.dart';
import 'package:evievm_app/src/shared/widgets/app_image.dart';
import 'package:flutter/material.dart';

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
        return AppImage(images[index].imageProvider);
      }),
    );
  }
}
