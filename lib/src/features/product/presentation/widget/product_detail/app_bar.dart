import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/presentation/widget/cart_button.dart';
import 'package:evievm_app/src/shared/widgets/back_button.dart';
import 'package:evievm_app/src/shared/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailAppBar extends StatelessWidget {
  final ProductDetailDto productDetail;

  const ProductDetailAppBar({super.key, required this.productDetail});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: ImageSlider(images: productDetail.images),
        ),
        centerTitle: true,
        expandedTitleScale: 1,
        collapseMode: CollapseMode.pin,
      ),
      elevation: 2,
      pinned: true,
      stretchTriggerOffset: 56,
      leading: const PShopBackButton(),
      // collapsedHeight: 96, // hight when pined
      expandedHeight: 300.h,
      automaticallyImplyLeading: false,
      backgroundColor: EVMColors.white,
      title: Text(
        productDetail.name,
        style: textTheme.titleSmall?.copyWith(color: AppColors.black),
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.share_outlined,
            color: AppColors.icon,
          ),
          onPressed: () {},
        ),
        CartButton(size: 28.r)
      ],
    );
  }
}
