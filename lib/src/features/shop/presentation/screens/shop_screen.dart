import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/home/presentation/widgets/product_cates.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_slidergrid_bloc_builder.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/search_bar_and_banner.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_product_slidergrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key, required this.scrollController}) : super(key: key);
  final ScrollController scrollController;

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final _pageStorageBucket = PageStorageBucket();

  @override
  void initState() {
    loginBloc.add(OnDoCheckLogin(
      onDidLogin: () {
        getIt<ShoppingCartBloc>().add(OnGetShoppingCart());
      },
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: PageStorage(
        bucket: _pageStorageBucket,
        child: Scaffold(
          body: CustomScrollView(
            controller: widget.scrollController,
            slivers: [
              ShopSearchBarAndBanner(size: size),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.r),
                  child: const ProductCates(),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                sliver: ShopProductSliverGrid(),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.small(
            onPressed: () {},
            tooltip: 'Thêm sản phẩm',
            backgroundColor: AppColors.primaryShop,
            child: Icon(Icons.add, color: AppColors.white, size: 20.r),
          ),
        ),
      ),
    );
  }
}
