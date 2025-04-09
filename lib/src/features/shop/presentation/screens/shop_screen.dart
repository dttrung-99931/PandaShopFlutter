// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/account_screen.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_product_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/register_shop_screen.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/shop_product_detail_screen.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop/product_cates.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop/search_bar_and_banner.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop/shop_product_slidergrid.dart';
import 'package:evievm_app/src/shared/widgets/common/app_floating_action_btn.dart';
import 'package:evievm_app/src/shared/widgets/common/unregister_widget.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/sliver/sliver_session.dart';
import 'package:evievm_app/src/shared/widgets/sliver/sliver_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key, required this.scrollController});
  final ScrollController scrollController;
  final _pageStorageBucket = PageStorageBucket();

  static void refreshData() {
    shopProductBloc.add(OnGetShopProducts());
    shopProductBloc.add(OnGetShopProductCates());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        refreshData();
      },
      child: SafeArea(
        top: false,
        child: PageStorage(
          bucket: _pageStorageBucket,
          child: CustomBlocBuilder<UserBloc>(
            buildForStates: const [GetUserDetailSuccess],
            handleLoading: false,
            builder: (state) {
              return Scaffold(
                body: Global.userDetail == null
                    ? const Center(child: NotLoginWidget())
                    : Global.shop == null
                        ? Center(
                            child: UnregisterWidget(
                              title: 'Bạn chưa đăng ký bán hàng!',
                              buttonTitle: 'Tạo cửa hàng',
                              onPressed: () {
                                Global.pushNamed(RegisterShopScreen.router);
                              },
                            ),
                          )
                        : _ShopBody(scrollController: scrollController),
                floatingActionButton: Global.shop == null
                    ? null
                    : AppFloatingActionButton(
                        onPressed: () {
                          Global.pushNamed(
                            ShopProductDetailScreen.router,
                            args: ShopProductDetailScreenArgs(productId: null),
                          );
                        },
                        title: 'Thêm sản phẩm',
                      ),
              ).skeleton(
                ([LoadingState, InitialState].contains(state.runtimeType)),
                context,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ShopBody extends StatelessWidget {
  const _ShopBody({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        const ShopSearchBarAndBanner(),
        SliverSizedBox(height: 4.h),
        SliverSection(
          padding: EdgeInsets.all(8.r),
          title: 'Phân loại sản phẩm shop của bạn',
          contentPadding: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.r),
            child: const ShopProductCates(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
            child: Text(
              'Các cản phẩm',
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(8.r),
          sliver: const ShopProductSliverGrid(),
        ),
      ],
    );
  }
}
