import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_slidergrid_bloc_builder.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../shared/widgets/hidden_on_scroll_bottom_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/categories.dart';
import '../widgets/home_menu.dart';
import '../../../product/presentation/widget/product_gridview.dart';
import '../../../product/presentation/widget/product_slidergrid.dart';
import '../widgets/search_bar_and_banner.dart';

class HomeScreen extends StatelessWidget {
  static const router = '/home';

  HomeScreen({Key? key}) : super(key: key);
  final _pageStorageBucket = PageStorageBucket();
  final _scrollController = ScrollController();

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
              const SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                sliver: HomeMenu(),
              ),
              const Categories(),
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: ProductSliverGridBlocBuilder<HomeBloc>(
                  inititalEvent: OnGetHomeProducts(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HiddenOnSrollWidget(
        _scrollController,
        child: const HomeBottomNavBar(),
      ),
    );
  }
}
