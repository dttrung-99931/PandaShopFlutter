// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/data/models/request/shopping_cart/upsert_cart_request_model.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto_ext.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/screens/product_detail_screen.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/widget/product_counter.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCartAndBuyBottomBar extends StatelessWidget {
  const AddCartAndBuyBottomBar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      margin: EdgeInsets.zero,
      child: SizedBox(
        height: 60.h,
        child: Row(
          children: [
            AddToCartButton(size: size),
            const Expanded(
              child: BuyNowButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CustomClipPath(),
      child: Container(
        color: AppColors.primary,
        margin: const EdgeInsets.all(4),
        child: TextButton(
          onPressed: () {},
          child: Text(
            "Mua ngay",
            style: textTheme.bodyLarge?.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size.width * 0.45,
      child: CustomBlocBuilder<ProductOptionBloc>(builder: (_) {
        ProductOptionDto? option = productOptionBloc.selectedOption;
        if (option == null) return emptyWidget;
        if (option.remainingNum == 0) {
          return Text('Sản phẩm hết hàng',
              style: textTheme.bodyMedium.withColor(
                AppColors.blackLight.withOpacity(0.7),
              ));
        }
        return CustomBlocConsumer<ShoppingCartBloc>(
            key: GlobalKey(),
            listener: (state) {
              if (state is GetShoppingCartSuccess && Global.currentRoute == ProductDetailScreen.router) {
                // TODO: fix show message only when adding new product
                // showSnackBar('Đã thêm vào giỏ hàng');
              }
            },
            buildCondition: (state) => state is! ErrorState,
            buildForStates: const [UpsertShoppingCartSuccess, GetShoppingCartSuccess],
            builder: (state) {
              if (state is ShoppingCartUpdated) {
                CartItemDto? item = state.data.getCartItemOf(option.id);
                if (item != null && item.productNum > 0) {
                  // TODO: fix wrong ProductCounter show a short time right after open prod detail screen
                  return ProductCounter(item: item, comfirmDelete: false);
                }
              }

              return _addCartButton(option);
            });
      }),
    );
  }

  TextButton _addCartButton(ProductOptionDto option) {
    return TextButton(
      onPressed: () {
        doIfLoggedIn(() {
          shoppingCartBloc.add(
            OnUpsertCart(
              requestModel: UpsertCartRequestModel(
                productOptionId: option.id,
                productNum: productOptionBloc.productQuantity,
              ),
            ),
          );
        }, navToLoginIfNot: true);
      },
      child: Text("Thêm giỏ hàng", style: textTheme.bodyLarge),
    );
  }
}

class _CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(24, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
  // oldClipper != this
}
