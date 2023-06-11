// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';

class ImageSlider extends StatelessWidget {
  final List<ImageDto> images;

  const ImageSlider({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: images.length,
      itemBuilder: ((context, index) {
        return CachedNetworkImage(imageUrl: images[index].link);
      }),
    );
  }
}
