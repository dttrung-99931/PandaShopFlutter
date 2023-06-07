import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'banner_slider.dart';
import 'search_bar.dart';

class SearchBarAndBanner extends StatelessWidget {
  const SearchBarAndBanner({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: BannerSlider(size: size),
        centerTitle: true,
        expandedTitleScale: 1,
        collapseMode: CollapseMode.pin,
      ),
      stretchTriggerOffset: 56,
      // collapsedHeight: 96, // hight when pined
      expandedHeight: 200,
      pinned: true,
      backgroundColor: AppColors.primary,
      title: const SearchBar(),
    );
  }
}
