import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/add_cart_and_buy_bottom_bar.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/app_bar.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/description_and_propreties.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/name_and_price.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_detail/product_option.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/hidden_on_scroll_bottom_bar.dart';
import 'package:evievm_app/src/shared/widgets/not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/base_bloc/base_state.dart';

class ProductDetailScreenArgs {
  final int productId;
  final int? selectedOptionId;

  ProductDetailScreenArgs(this.productId, {this.selectedOptionId});
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
    getIt<ProductDetailBloc>().add(
      OnGetProductDetail(widget.args.productId, selectedOptionId: widget.args.selectedOptionId),
    );
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
      bottomNavigationBar: HiddenOnSrollWidget(
        scrollController: _scrollContorller,
        child: const AddCartAndBuyBottomBar(),
      ),
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
          ProductDetailAppBar(productDetail: productDetail),
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
