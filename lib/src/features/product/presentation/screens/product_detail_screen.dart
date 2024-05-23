import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/bottom_bar/bottom_bar.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/bottom_bar/user_bottom_bar.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/app_bar.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/description_and_propreties.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/name_and_price.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/product_option.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/hidden_on_scroll_bottom_bar.dart';
import 'package:evievm_app/src/shared/widgets/not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/base_bloc/base_state.dart';

enum ProductDetailViewMode { shopView, userView }

class ProductDetailScreenArgs {
  final int productId;
  final int? selectedOptionId;
  final ProductDetailViewMode viewMode;

  ProductDetailScreenArgs(
    this.productId, {
    this.selectedOptionId,
    this.viewMode = ProductDetailViewMode.userView,
  });
}

class ProductDetailScreen extends StatefulWidget {
  static const router = '/productDetail';

  final ProductDetailScreenArgs args;

  const ProductDetailScreen(this.args, {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final _scrollContorller = ScrollController();

  @override
  void initState() {
    super.initState();
    productDetailBloc.add(OnGetProductDetail(
      widget.args.productId,
      selectedOptionId: widget.args.selectedOptionId,
    ));
    loginBloc.add(OnDoCheckLogin(
      onDidLogin: () => shoppingCartBloc.add(OnGetShoppingCart()),
    ));
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
        child: CustomBlocBuilder<ProductDetailBloc>(
          buildForStates: const [GetProductDetailSucess],
          loadingStateType: LoadingProductDetail,
          builder: _productDetailBuilder,
        ),
      ),
      bottomNavigationBar: ProductDetailBottomBar(args: widget.args, scrollController: _scrollContorller),
    );
  }

  Widget _productDetailBuilder(BaseState state) {
    if (state is GetProductDetailSucess) {
      if (state.data == null) {
        return const NotFound();
      }
      ProductDetailDto productDetail = state.data!;
      return CustomScrollView(
        controller: _scrollContorller,
        physics: const BouncingScrollPhysics(),
        slivers: [
          ProductDetailAppBar(productDetail: productDetail, args: widget.args),
          ProductNameAndPrice(productDetail: productDetail),
          ProductOptions(productDetail: productDetail),
          ProductDescriptionAndProperties(productDetail: productDetail),
          // const SliverSection(
          //   title: 'Sản phẩm tương tự',
          //   child: ProductGridViewBlocBuilder<HomeBloc>(),
          // ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
