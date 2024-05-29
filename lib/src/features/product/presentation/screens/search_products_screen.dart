import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/search/search_products_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/product_slidergrid.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:evievm_app/src/shared/widgets/search_bar.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/base_bloc/base_state.dart';
import '../../../../shared/widgets/back_button.dart';
import '../widget/product/search_products_suggestions.dart';

class SearchProductsScreen extends StatefulWidget {
  static const router = '/searchProducts';

  const SearchProductsScreen({super.key});

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  @override
  void initState() {
    super.initState();
    getIt<SearchProductsBloc>().add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              sliver: const _SliverSearchBar(),
            ),
            CustomBlocConsumer<SearchProductsBloc>(
              isSliver: true,
              loadingStateType: LoadingProducts,
              buildForStates: const [SearchProductsSucess, GetProductsSucess, LoadingProducts, InitialState],
              listenForStates: const [GetProductsSucess],
              listener: (state) {
                if (state is GetProductsSucess) {
                  removeCurrentFocus();
                }
              },
              builder: (state) {
                if (state is SearchProductsSucess) {
                  return SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                    sliver: SearchProductsSuggestions(state),
                  );
                }
                if (state is GetProductsSucess) {
                  return ProductSliverGrid(state.data, padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w));
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverSearchBar extends StatelessWidget {
  const _SliverSearchBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      stretchTriggerOffset: 56,
      floating: true,
      backgroundColor: EVMColors.background,
      snap: true,
      titleSpacing: 0,
      elevation: 2.r,
      title: Row(
        children: [
          const PShopBackButton(),
          sw(2.w),
          Expanded(
            child: AppSearchBar(
              controller: getIt<SearchProductsBloc>().edtController,
              autoFocus: true,
              onTextChanged: (text) {
                getIt<SearchProductsBloc>().add(OnSearchProducts(text ?? ''));
              },
              onSearch: (text) {
                getIt<SearchProductsBloc>().add(OnGetProducts(q: text));
              },
            ),
          ),
        ],
      ),
    );
  }
}
