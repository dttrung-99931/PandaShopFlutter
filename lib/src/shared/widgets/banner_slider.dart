// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';

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
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: CachedNetworkImage(
                  imageUrl: img.link,
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
