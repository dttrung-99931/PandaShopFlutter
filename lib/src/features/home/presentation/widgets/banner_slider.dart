import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../core/utils/dummy_data.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: DummyData.bannerImages
          .map(
            (imgUrl) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
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
