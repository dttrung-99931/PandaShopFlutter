import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/home/presentation/widgets/product_cates.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/product_slidergrid_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/search_bar_and_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.scrollController}) : super(key: key);
  final ScrollController scrollController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          },
          child: CustomScrollView(
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
