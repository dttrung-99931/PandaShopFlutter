import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/dimensions.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/screens/shopping_cart_screen.dart';
import 'package:evievm_app/src/features/product/presentation/widget/add_cart_and_buy.dart';
import 'package:evievm_app/src/features/product/presentation/widget/cart_button.dart';
import 'package:evievm_app/src/shared/widgets/color_container.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/hidden_on_scroll_bottom_bar.dart';
import 'package:evievm_app/src/shared/widgets/image_slider.dart';
import 'package:evievm_app/src/shared/widgets/not_found.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:evievm_app/src/shared/widgets/sliver_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/base_bloc/base_state.dart';
import '../../../../shared/widgets/back_button.dart';
import '../widget/price_widget.dart';

class ProductDetailScreenArgs {
  final int productId;

  ProductDetailScreenArgs(this.productId);
}

class ProductDetailScreen extends StatefulWidget {
  static const router = '/productDetail';

  final ProductDetailScreenArgs args;

  const ProductDetailScreen(this.args, {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailBloc _bloc = getIt();
  final _scrollContorller = ScrollController();

  @override
  void initState() {
    super.initState();
    getIt<ProductDetailBloc>().add(OnGetProductDetail(widget.args.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.background,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.primary,
        ),
        elevation: 0,
        toolbarHeight: 0,
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
        slivers: [
          _SliverAppBar(productDetail: productDetail),
          _ProductNameAndPrice(productDetail: productDetail),
          _ProductOptions(productDetail: productDetail),
          _ProductDescriptionAndProperties(productDetail: productDetail),
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

class _ProductDescriptionAndProperties extends StatelessWidget {
  const _ProductDescriptionAndProperties({
    required this.productDetail,
  });

  final ProductDetailDto productDetail;

  @override
  Widget build(BuildContext context) {
    return SliverSection(
      title: 'Thông tin sản phẩm',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productDetail.description, style: textTheme.bodyLarge),
          if (productDetail.propertyValues.isNotEmpty) ...[
            sh(16.h),
            Text(
              'Thông số',
              style: textTheme.bodyLarge?.copyWith(color: EVMColors.black.withOpacity(.8)),
            ),
            sh(4.h),
            ...productDetail.propertyValues.map(
              (e) => Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  children: [
                    Text(e.name, style: textTheme.bodyMedium?.semibold()),
                    const Spacer(),
                    Text(e.value, style: textTheme.bodyMedium),
                  ],
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}

class _ProductOptions extends StatelessWidget {
  const _ProductOptions({
    required this.productDetail,
  });

  final ProductDetailDto productDetail;

  @override
  Widget build(BuildContext context) {
    return SliverSection(
      title: 'Phân loại',
      child: CustomBlocBuilder<ProductOptionBloc>(
          buildForStates: const [OptionSelectedChanged],
          builder: (state) {
            if (state is! OptionSelectedChanged) {
              return const SizedBox.shrink();
            }
            return Column(
              children: state.selectablePropVals.entries
                  .map<Widget>(
                    (MapEntry<String, List<SelectableValueDto>> entry) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: _OptionPropertySelect(
                        propertyName: entry.key,
                        selectableValues: entry.value,
                      ),
                    ),
                  )
                  .toList()
                  .addBetweenEvery(sh(2.h)),
            );
          }),
    );
  }
}

class _OptionPropertySelect extends StatefulWidget {
  final String propertyName;
  final List<SelectableValueDto> selectableValues;

  const _OptionPropertySelect({
    required this.propertyName,
    required this.selectableValues,
  });

  @override
  State<_OptionPropertySelect> createState() => _OptionPropertySelectState();
}

class _OptionPropertySelectState extends State<_OptionPropertySelect> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TODO: make this shorter, add 'view more' button
        Text(widget.propertyName, style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
        const Spacer(),
        ...widget.selectableValues
            .map<Widget>(
              (selectableVal) => InkWell(
                onTap: selectableVal.isSelectable && !selectableVal.isSelected
                    ? () {
                        getIt<ProductOptionBloc>().add(
                          OnOptionPropSelectedChagned(
                            propertyName: widget.propertyName,
                            value: selectableVal.value,
                            isSelected: !selectableVal.isSelected,
                          ),
                        );
                      }
                    : null,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectableVal.isSelected ? AppColors.black.withOpacity(.6) : EVMColors.transparent,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 4.h,
                    horizontal: 12.h,
                  ),
                  child: Text(
                    selectableVal.value,
                    style: textTheme.bodyMedium?.copyWith(
                      color: selectableVal.isSelected
                          ? AppColors.white
                          : Colors.black.withOpacity(selectableVal.isSelectable ? 1 : .36),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
            .toList()
            .addBetweenEvery(
              SizedBox(
                width: 4.w,
              ),
            )
      ],
    );
  }
}

class _ProductNameAndPrice extends StatelessWidget {
  const _ProductNameAndPrice({
    required this.productDetail,
  });

  final ProductDetailDto productDetail;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: Dimensions.paddingAll.copyWith(top: 16.h, bottom: 16.h),
        color: EVMColors.white,
        child: Column(
          children: [
            Text(
              productDetail.name,
              style: textTheme.titleSmall?.copyWith(color: EVMColors.black),
              textAlign: TextAlign.center,
            ),
            CustomBlocBuilder<ProductOptionBloc>(
                buildForStates: const [OptionSelectedChanged],
                builder: (state) {
                  if (state is OptionSelectedChanged && state.selectedOption != null) {
                    return PriceWidget(state.selectedOption!.price);
                  }
                  return const SizedBox.shrink();
                }),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  final ProductDetailDto productDetail;

  const _SliverAppBar({required this.productDetail});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: ImageSlider(images: productDetail.images),
        ),
        centerTitle: true,
        expandedTitleScale: 1,
        collapseMode: CollapseMode.pin,
      ),
      elevation: 2,
      pinned: true,
      stretchTriggerOffset: 56,
      leading: const PShopBackButton(),
      // collapsedHeight: 96, // hight when pined
      expandedHeight: 300.h,
      automaticallyImplyLeading: false,
      backgroundColor: EVMColors.white,
      title: Text(
        productDetail.name,
        style: textTheme.titleSmall?.copyWith(color: EVMColors.black),
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.share_outlined,
          ),
          onPressed: () {},
        ),
        const CartButton()
      ],
    );
  }
}
