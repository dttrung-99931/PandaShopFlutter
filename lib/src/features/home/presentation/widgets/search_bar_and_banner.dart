import 'package:evievm_app/src/features/product/presentation/screens/search_products_screen.dart';
import 'package:evievm_app/src/features/product/presentation/widget/cart_button.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/dummy_data.dart';
import '../../../../shared/widgets/search_bar.dart';
import '../../../../shared/widgets/banner_slider.dart';

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
        background: BannerSlider(images: DummyData.bannerImages),
        centerTitle: true,
        expandedTitleScale: 1,
        collapseMode: CollapseMode.pin,
      ),
      stretchTriggerOffset: 56,
      // collapsedHeight: 96, // hight when pined
      expandedHeight: 200,
      pinned: true,
      backgroundColor: AppColors.primary,
      title: SearchBar(
        autoFocus: true,
        navigateToScreenOnPressed: SearchProductsScreen.router,
      ),
      actions: [
        CartButton(size: 32.r),
        sw(12.w),
      ],
    );
  }
}
