import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/image/image_input_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_detail/image/images_input_slider.dart';
import 'package:evievm_app/src/shared/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Edit shop images
class ShopProductDetailAppBar extends StatelessWidget {
  const ShopProductDetailAppBar({this.productDetail, super.key});
  final ProductDetailDto? productDetail;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: ImagesInputSlider(
            initImages: (productDetail?.images ?? []).mapList((element) => ImageInputDto.adaptFromImageDto(element)),
          ),
        ),
        centerTitle: true,
        expandedTitleScale: 1,
        collapseMode: CollapseMode.pin,
      ),
      elevation: 2,
      pinned: true,
      stretchTriggerOffset: 56,
      leading: const PShopBackButton(color: AppColors.primary),
      // collapsedHeight: 96, // hight when pined
      expandedHeight: 300.h,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      titleSpacing: 8.w,
      title: InfoInput(
        showTitle: false,
        hint: 'Tên sản phẩm',
        titleFlex: 6,
        controller: shopProductDetailBloc.productNameController,
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.black,
      ),
    );
  }
}
