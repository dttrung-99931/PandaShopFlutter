import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/dimensions.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/search/search_products_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_gridview_bloc_builder.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_slidergrid.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_slidergrid_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:evievm_app/src/shared/widgets/image_slider.dart';
import 'package:evievm_app/src/shared/widgets/not_found.dart';
import 'package:evievm_app/src/shared/widgets/search_bar.dart';
import 'package:evievm_app/src/shared/widgets/sliver_section.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/base_bloc/base_state.dart';
import '../../../../shared/widgets/back_button.dart';
import '../../../../shared/widgets/banner_slider.dart';
import '../widget/search_products_suggestions.dart';

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
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.primary, 
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
    );
  }

  Widget _productDetailBuilder(BaseState state) {
    if (state is GetProductDetailSucess) {
      if (state.data == null) {
        return const NotFound();
      }
      ProductDetailDto productDetail = state.data!;
      return CustomScrollView(
        slivers: [
          _SliverAppBar(productDetail: productDetail),
          _ProductName(productDetail: productDetail),
          _ProductDescriptionAndProperties(productDetail: productDetail),
          _ProductOptions(productDetail: productDetail),
          const SliverSection(
            title: 'Sản phẩm tương tự',
            child: ProductGridViewBlocBuilder<HomeBloc>(),
          ),
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
          Text(productDetail.description, style: textTheme.bodyMedium),
          if (productDetail.propertyValues.isNotEmpty) ...[
            sh(16.h),
            Text('Thông số', style: textTheme.bodyLarge),
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
      title: 'Phần loại',
      child: Column(
        children: productDetail.optionProperties.entries
            .map(
              (MapEntry<String, Set<String>> propertyAndValues) => Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  children: [
                    // TODO: make this shorter, add 'view more' button
                    Text(propertyAndValues.key, style: textTheme.bodyMedium?.semibold()),
                    const Spacer(),
                    ...propertyAndValues.value.map<Widget>((value) => Text(value)).toList().addBetweenEvery(
                          SizedBox(
                            width: 4.w,
                          ),
                        )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ProductName extends StatelessWidget {
  const _ProductName({
    required this.productDetail,
  });

  final ProductDetailDto productDetail;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: Dimensions.paddingAll,
        color: EVMColors.white,
        child: Text(productDetail.name, style: textTheme.titleSmall, textAlign: TextAlign.center),
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
      stretchTriggerOffset: 56,
      leading: const PShopBackButton(),
      // collapsedHeight: 96, // hight when pined
      expandedHeight: 300.h,
      automaticallyImplyLeading: false,
      backgroundColor: EVMColors.white,
      title: Text(productDetail.name, style: textTheme.titleSmall),
    );
  }
}
