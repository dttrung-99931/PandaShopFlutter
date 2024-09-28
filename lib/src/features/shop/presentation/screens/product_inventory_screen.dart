// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/price_widget.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/product_inventory_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop/shop_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_inventory/product_inventory_addition_dialog.dart';
import 'package:evievm_app/src/shared/widgets/common/app_floating_action_btn.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/product/image_on_item.dart';
import 'package:evievm_app/src/shared/widgets/product/product_properties_widget.dart';
import 'package:evievm_app/src/shared/widgets/utils/validation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInventoryArgs {
  final int productId;
  ProductInventoryArgs({
    required this.productId,
  });
}

class ProductInventoryScreen extends StatefulWidget {
  static const router = '/productInventory';
  const ProductInventoryScreen(
    this.args, {
    super.key,
  });
  final ProductInventoryArgs args;

  @override
  State<ProductInventoryScreen> createState() => _ProductInventoryScreenState();
}

class _ProductInventoryScreenState extends ValidationState<ProductInventoryScreen, ShopBloc> {
  @override
  void initState() {
    productInventoryBloc.add(OnGetProductInventory(productId: widget.args.productId));
    super.initState();
  }

  @override
  void dispose() {
    getIt.resetLazySingleton<ProductInventoryBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const CustomScrollView(
        slivers: [
          _AppBar(),
          _Body(),
        ],
      ),
      floatingActionButton: AppFloatingActionButton(
        title: 'Nhập sản phẩmpphẩmp',
        color: AppColors.primary,
        onPressed: () {
          ProductInventoryAdditionDialog(
            onAddSuccessed: () {
              productInventoryBloc.add(OnGetProductInventory(productId: widget.args.productId));
              productDetailBloc.add(OnGetProductDetail(widget.args.productId));
            },
          ).show(context);
        },
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: true,
      leading: const BackButton(),
      stretchTriggerOffset: 56,
      floating: true,
      snap: true,
      elevation: 2.r,
      title: CustomBlocBuilder<ProductInventoryBloc>(
        buildForStates: const [GetProductInventorySuccess],
        builder: (state) {
          return Text(
            'Kho ${state is GetProductInventorySuccess ? state.data.product.name : ''}',
            style: textTheme.titleSmall?.withColor(AppColors.white),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<ProductInventoryBloc>(
      isSliver: true,
      buildForStates: const [GetProductInventorySuccess],
      builder: (state) {
        if (state is GetProductInventorySuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.data.optionInventories.length,
              (context, index) {
                return ProductOptionInventoryItem(
                  optionInventory: state.data.optionInventories[index],
                  optionImageLink: state.data.product.thumbnailUrl,
                );
              },
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}

class ProductOptionInventoryItem extends StatelessWidget {
  const ProductOptionInventoryItem({
    super.key,
    required this.optionInventory,
    required this.optionImageLink,
  });

  final ProductOptionInvetoryDto optionInventory;
  // TODO: get from ProductOtionDto insted of this
  final String? optionImageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 0),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: IntrinsicHeight(
              child: ImageOnItem(imageLink: optionImageLink),
            ),
          ),
          8.swb,
          Expanded(
            child: InkWell(
              onTap: () {
                // Global.pushNamedSafe(
                //   ProductDetailScreen.router,
                //   args: ProductDetailScreenArgs(optionInventory.product.id,
                //       selectedOptionId: optionInventory.prouductOption.id),
                // );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 12.h * 2,
                          ),
                          child: Text(
                            optionInventory.productOption.name ?? '',
                            style: textTheme.bodyLarge?.withWeight(FontWeight.w500).overflowElipse().withColor(
                                  AppColors.black.withOpacity(.8),
                                ),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      const Spacer(),
                      PriceWidget(optionInventory.productOption.price),
                      4.swb,
                    ],
                  ),
                  8.shb,
                  ProductPropertiesWidget(properties: optionInventory.productOption.propertyValues),
                  8.shb,
                  Row(
                    children: [
                      const Text('Số lượng: '),
                      Text(optionInventory.number.toString(), style: textTheme.bodyMedium.bold()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
