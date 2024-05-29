// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/product/presentation/screens/product_detail_screen.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/bottom_bar/shop_bottom_bar.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/bottom_bar/user_bottom_bar.dart';
import 'package:evievm_app/src/shared/widgets/hidden_on_scroll_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailBottomBar extends StatelessWidget {
  const ProductDetailBottomBar({
    super.key,
    required this.args,
    required this.scrollController,
  });
  final ProductDetailScreenArgs args;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return HiddenOnSrollWidget(
      height: args.viewMode == ProductDetailViewMode.userView ? 56.h : null,
      scrollController: scrollController,
      child: Builder(
        builder: (context) {
          switch (args.viewMode) {
            case ProductDetailViewMode.userView:
              return const AddCartAndBuyBottomBar();
            case ProductDetailViewMode.shopView:
              return const ShopProductDetailBottomBar();
          }
        },
      ),
    );
  }
}
