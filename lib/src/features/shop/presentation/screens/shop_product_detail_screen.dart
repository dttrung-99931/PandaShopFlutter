import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_detail/app_bar.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_detail/name_and_price.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_detail/product_cate_input.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/sliver/sliver_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopProductDetailScreenArgs {
  final int? productId; // = null mean create mode. Otherwise edit mode

  ShopProductDetailScreenArgs({this.productId});
}

class ShopProductDetailScreen extends StatefulWidget {
  static const router = '/shopProductDetail';

  final ShopProductDetailScreenArgs args;

  const ShopProductDetailScreen(this.args, {super.key});

  @override
  State<ShopProductDetailScreen> createState() => _ShopProductDetailScreenState();
}

class _ShopProductDetailScreenState extends State<ShopProductDetailScreen> {
  final _scrollContorller = ScrollController();

  @override
  void initState() {
    super.initState();
    shopProductDetailBloc.add(
      OnInitShopProduct(productId: widget.args.productId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.background,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: CustomBlocBuilder<ShopProductDetailBloc>(
            buildForStates: const [InitShopProductSuccess],
            builder: (state) {
              if (state is! InitShopProductSuccess) {
                return emptyWidget;
              }
              return CustomScrollView(
                controller: _scrollContorller,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  ShopProductDetailAppBar(productDetail: state.productDetail),
                  SliverSizedBox(height: 2.h),
                  const SliverToBoxAdapter(child: ProductCateInput()),
                  // ShopProductNameAndPrice(productDetail: productDetail),
                  // ShopProductOptions(productDetail: productDetail),
                  // ShopProductDescriptionAndProperties(productDetail: productDetail),
                ],
              );
            }),
      ),
    );
  }
}
