import 'package:evievm_app/core/ui/auto_reset_bloc_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/home/presentation/widgets/product_cates.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/product_slidergrid_bloc_builder.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/search_bar_and_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AutoResetBlocState<HomeScreen, HomeBloc> {
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
        child: RefreshIndicator(
          displacement: 20,
          onRefresh: () async {
            homeBloc.add(OnGetHomeBanners());
            homeBloc.add(OnGetHomeProductCates());
            homeBloc.add(OnGetHomeProducts());
            loginBloc.add(OnDoCheckLogin(
              onDidLogin: () {
                shoppingCartBloc.add(OnGetShoppingCart());
              },
            ));
          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: widget.scrollController,
            slivers: [
              SearchBarAndBanner(size: size),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.r),
                  child: const HomeProductCates(),
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
    );
  }
}
