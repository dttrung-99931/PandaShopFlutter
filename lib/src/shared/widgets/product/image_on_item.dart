// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageOnItem extends StatelessWidget {
  const ImageOnItem({
    Key? key,
    required this.imageLink,
    this.width,
  }) : super(key: key);
  final String? imageLink;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return imageLink != null
        ? ExtendedImage.network(
            width: width,
            imageLink!,
            // width: 72.r,
            height: 72.r,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          )
        : Assets.img.noImage.build(
            width: width,
          );
  }
}
