import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/presentation/screens/product_detail_screen.dart';
import 'package:evievm_app/src/features/product/presentation/widget/cart_button.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_product_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/shop_product_detail_screen.dart';
import 'package:evievm_app/src/shared/widgets/app_alert_dialog.dart';
import 'package:evievm_app/src/shared/widgets/back_button.dart';
import 'package:evievm_app/src/shared/widgets/common/app_icon_button.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:evievm_app/src/shared/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailAppBar extends StatelessWidget {
  final ProductDetailDto productDetail;
  final ProductDetailScreenArgs args;

  const ProductDetailAppBar({
    super.key,
    required this.productDetail,
    required this.args,
  });

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
      leading: const PShopBackButton(color: AppColors.primary),
      // collapsedHeight: 96, // hight when pined
      expandedHeight: 300.h,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      titleSpacing: 8.w,
      title: Text(
        productDetail.name,
        style: textTheme.titleSmall?.copyWith(color: AppColors.black),
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      actions: _actionsButtons(context),
    );
  }

  List<Widget> _actionsButtons(BuildContext context) {
    switch (args.viewMode) {
      case ProductDetailViewMode.shopView:
        return [
          CustomBlocListener<ShopProductBloc>(
            listener: (state) {
              if (state is DeleteProductSuccess) {
                showSnackBar('Đã xóa sản phẩm!');
                Global.pop();
                shopProductBloc.add(OnGetShopProducts());
              }
            },
            child: AppIconButton(
              iconData: Icons.delete,
              color: AppColors.primary,
              padding: EdgeInsets.all(12.r),
              onPressed: () {
                AppAlertDialog.show(
                  context: context,
                  title: 'Xác nhận xóa sản phẩm',
                  onConfirm: () {
                    shopProductBloc.add(OnDeleteProduct(productId: productDetail.id));
                  },
                );
              },
            ),
          ),
          AppIconButton(
            iconData: Icons.edit,
            color: AppColors.primary,
            padding: EdgeInsets.all(12.r),
            onPressed: () {
              Global.pushNamed(
                ShopProductDetailScreen.router,
                args: ShopProductDetailScreenArgs(productId: args.productId),
              );
            },
          ),
        ];
      case ProductDetailViewMode.userView:
        return [
          IconButton(
            icon: const Icon(
              Icons.share_outlined,
              color: AppColors.primary,
            ),
            onPressed: () {},
          ),
          CartButton(size: 28.r)
        ];
    }
  }
}
