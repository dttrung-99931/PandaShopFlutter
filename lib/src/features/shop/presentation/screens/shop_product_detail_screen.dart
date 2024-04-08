import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/presentation/widget/address/address_input.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_detail/product_address_input.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_detail/app_bar.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_detail/bottom_bar.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_detail/name_and_price.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_detail/product_cate_input.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_detail/product_description.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_detail/product_options_input.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_detail/product_propreties_input.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:evievm_app/src/shared/widgets/hidden_on_scroll_bottom_bar.dart';
import 'package:evievm_app/src/shared/widgets/sliver/sliver_sized_box.dart';
import 'package:evievm_app/src/shared/widgets/utils/validation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../product/presentation/widget/product_detail/bottom_bar/user_bottom_bar.dart';

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

class _ShopProductDetailScreenState extends ValidationState<ShopProductDetailScreen, ShopProductDetailBloc> {
  final _scrollContorller = ScrollController();

  @override
  void initState() {
    super.initState();
    shopProductDetailBloc.add(
      OnInitShopProduct(productId: widget.args.productId),
    );
  }

  @override
  void dispose() {
    super.dispose();
    getIt.resetLazySingleton<ShopProductDetailBloc>();
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
      body: Form(
        key: formKey,
        onChanged: () {
          shopProductDetailBloc.add(OnValidateData());
        },
        child: SafeArea(
          child: CustomBlocConsumer<ShopProductDetailBloc>(
              listener: (state) {
                // if (state is CreateProductError) {}
              },
              buildForErrorState: false,
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
                    const SliverToBoxAdapter(child: ProductDescriptionInput()),
                    const SliverToBoxAdapter(child: ProductPropertiesInput()),
                    const SliverToBoxAdapter(child: ProductOptionsInput()),
                    const SliverToBoxAdapter(child: ProductAddressInput()),
                    SliverSizedBox(height: 32.h),
                  ],
                );
              }),
        ),
      ),
      bottomNavigationBar: HiddenOnSrollWidget(
        scrollController: _scrollContorller,
        height: 52.h,
        child: const ProductCreationBottomBar(),
      ),
    );
  }
}
