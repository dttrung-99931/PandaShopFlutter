// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSlider extends StatelessWidget {
  final List<ImageDto> images;

  const BannerSlider({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images
          .map(
            (img) => Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: ExtendedImage.network(
                  img.link,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        autoPlay: true,
        // deefault: false -> resize image and make it centrally
        disableCenter: false,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        viewportFraction: 0.48,
      ),
    );
  }
}
