// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:evievm_app/src/shared/dtos/image_dto.dart';
import 'package:evievm_app/src/shared/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSlider extends StatelessWidget {
  static const Duration slideDuration = Duration(milliseconds: 800);
  final List<ImageDto> images;

  /// This [animValue] is between 0 and 1
  final Function(double animValue)? onScroled;
  final void Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  const BannerSlider({
    super.key,
    required this.images,
    this.onScroled,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        final img = images[index];
        return BannerSliderItem(img: img);
      },
      options: CarouselOptions(
        autoPlayAnimationDuration: slideDuration,
        autoPlay: true,
        disableCenter: false,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        viewportFraction: 0.48,
        onPageChanged: onPageChanged,
        onScrolled: (value) {
          if (value != null) {
            onScroled?.call(value - value.floorToDouble());
          }
        },
      ),
    );
  }
}

class BannerSliderItem extends StatelessWidget {
  const BannerSliderItem({
    super.key,
    required this.img,
  });
  final ImageDto img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.r),
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: AppImage(
            img.imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
