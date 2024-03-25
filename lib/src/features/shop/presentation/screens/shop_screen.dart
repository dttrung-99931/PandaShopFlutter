import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/home/presentation/widgets/product_cates.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/shop_product_detail_screen.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_cates.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/search_bar_and_banner.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_product_slidergrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({Key? key, required this.scrollController}) : super(key: key);
  final ScrollController scrollController;
  final _pageStorageBucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: PageStorage(
        bucket: _pageStorageBucket,
        child: Scaffold(
          body: CustomScrollView(
            controller: scrollController,
            slivers: [
              ShopSearchBarAndBanner(size: size),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.r),
                  child: const ShopProductCates(),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                sliver: ShopProductSliverGrid(),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.small(
            onPressed: () {
              Global.pushNamed(
                ShopProductDetailScreen.router,
                args: ShopProductDetailScreenArgs(productId: null),
              );
            },
            tooltip: 'Thêm sản phẩm',
            backgroundColor: AppColors.primaryShop,
            child: Icon(Icons.add, color: AppColors.white, size: 20.r),
          ),
        ),
      ),
    );
  }
}
