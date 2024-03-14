import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/home/presentation/widgets/product_cates.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_slidergrid_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../shared/widgets/hidden_on_scroll_bottom_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/search_bar_and_banner.dart';

class HomeScreen extends StatefulWidget {
  static const router = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageStorageBucket = PageStorageBucket();
  final _scrollController = ScrollController();

  @override
  void initState() {
    getIt<ShoppingCartBloc>().add(OnGetShoppingCart(9));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        top: false,
        bottom: false,
        // Keep scroll position when come back after navigation
        child: PageStorage(
          bucket: _pageStorageBucket,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SearchBarAndBanner(size: size),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.r),
                  child: const ProductCates(),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                sliver: ProductSliverGridBlocBuilder<HomeBloc>(
                  inititalEvent: OnGetHomeProducts(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HiddenOnSrollWidget(
        scrollController: _scrollController,
        height: 64.h,
        child: const HomeBottomNavBar(),
      ),
    );
  }
}
