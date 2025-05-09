import 'package:evievm_app/core/ui/auto_reset_bloc_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/app_bar.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/bottom_bar/bottom_bar.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/description_and_propreties.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/name_and_price.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/product_option.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/not_found.dart';
import 'package:flutter/material.dart';

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

class _ProductDetailScreenState extends AutoResetBlocState<ProductDetailScreen, ProductDetailBloc> {
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
  void dispose() {
    _scrollContorller.dispose();
    super.dispose();
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
          loadingWidgetBuilder: () {
            // Loading ProductDetailContent
            return ProductDetailContent(
              scrollContorller: _scrollContorller,
              productDetail: ProductDetailDto.loading,
              args: widget.args,
            );
          },
          builder: (state) {
            if (state is GetProductDetailSucess) {
              if (state.data == null) {
                return const NotFound();
              }
              ProductDetailDto productDetail = state.data!;
              return ProductDetailContent(
                scrollContorller: _scrollContorller,
                productDetail: productDetail,
                args: widget.args,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      bottomNavigationBar: ProductDetailBottomBar(args: widget.args, scrollController: _scrollContorller),
    );
  }
}

class ProductDetailContent extends StatelessWidget {
  const ProductDetailContent({
    super.key,
    required ScrollController scrollContorller,
    required this.productDetail,
    required this.args,
  }) : _scrollContorller = scrollContorller;

  final ScrollController _scrollContorller;
  final ProductDetailDto productDetail;
  final ProductDetailScreenArgs args;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollContorller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        ProductDetailAppBar(productDetail: productDetail, args: args),
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
}
