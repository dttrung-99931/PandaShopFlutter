// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/screens/product_detail_screen.dart';
import 'package:evievm_app/src/features/product/presentation/widget/price_widget.dart';
import 'package:evievm_app/src/features/product/presentation/widget/shopping_cart/cart_item_properties.dart';
import 'package:evievm_app/src/features/product/presentation/widget/shopping_cart/product_counter.dart';
import 'package:evievm_app/src/shared/widgets/color_container.dart';
import 'package:evievm_app/src/shared/widgets/custom_statefull_checkbox.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum CartItemMode {
  cart,
  order;

  bool get showCheckBox {
    return this == cart;
  }

  bool get showProductCounter {
    return this == cart;
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.item,
    this.mode = CartItemMode.cart,
  });

  final CartItemDto item;
  final CartItemMode mode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 0),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          if (mode.showCheckBox)
            SizedBox(
              height: 64.h,
              child: CustomStatefullCheckbox(
                initialCheck: item.isSelected,
                shape: BoxShape.rectangle,
                onCheckChanged: (isChecked) {
                  shoppingCartBloc.add(OnCheckCartItem(isChecked: isChecked, item: item));
                },
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: IntrinsicHeight(
              child: ExtendedImage.network(
                item.product.thumbnailUrl,
                // width: 72.r,
                height: 72.r,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          sw(8.w),
          Expanded(
            child: InkWell(
              onTap: () {
                Global.pushNamedSafe(
                  ProductDetailScreen.router,
                  args: ProductDetailScreenArgs(item.product.id, selectedOptionId: item.prouductOption.id),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sh(2.h),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 12.h * 2,
                    ),
                    child: Text(
                      item.product.name,
                      style: textTheme.bodyLarge?.withWeight(FontWeight.w500).overflowElipse().withColor(
                            AppColors.black.withOpacity(.8),
                          ),
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // PriceWidget(item.product.price, isOriginalPrice: true),
                      PriceWidget(item.product.price),
                      ProductCounter(item: item, showCounter: mode.showProductCounter),
                    ],
                  ),
                  sh(8.h),
                  CartItemProperties(item: item),
                  sh(12.h),
                  Row(
                    children: [
                      Icon(Icons.add_location_rounded, color: AppColors.blackLight.withOpacity(0.8), size: 16.r),
                      sw(4.w),
                      Text(
                        'Shop Drunk ABC',
                        style: textTheme.labelMedium?.withColor(AppColors.blackLight).overflowElipse(),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
