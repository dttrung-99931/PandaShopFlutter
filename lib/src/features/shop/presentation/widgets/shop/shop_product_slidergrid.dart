import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';
import 'package:evievm_app/src/features/product/presentation/screens/product_detail_screen.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/product_slidergrid.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_product_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/base_bloc/base_state.dart';
import '../../../../../shared/widgets/custom_bloc_builder.dart';

class ShopProductSliverGrid extends StatefulWidget {
  const ShopProductSliverGrid({super.key});

  @override
  State<ShopProductSliverGrid> createState() => _ShopProductSliverGridState();
}

class _ShopProductSliverGridState extends State<ShopProductSliverGrid> {
  @override
  void initState() {
    if (Global.userDataLoaded) {
      shopProductBloc.add(OnGetShopProducts());
    }
    // TODO: create listen bloc state
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<ShopProductBloc>(
        buildForStates: const [LoadingState, ErrorState, GetShopProductsSucess],
        isSliver: true,
        loadingWidgetBuilder: () {
          return ProductSliverGrid(
            List.generate(4, (_) => ProductDto.loading),
            onPressed: (product) {
              Global.pushNamed(
                ProductDetailScreen.router,
                args: ProductDetailScreenArgs(
                  product.id,
                  viewMode: ProductDetailViewMode.shopView,
                ),
              );
            },
          );
        },
        builder: (state) {
          if (state is GetShopProductsSucess) {
            return ProductSliverGrid(
              state.data,
              onPressed: (product) {
                Global.pushNamed(
                  ProductDetailScreen.router,
                  args: ProductDetailScreenArgs(
                    product.id,
                    viewMode: ProductDetailViewMode.shopView,
                  ),
                );
              },
            );
          }

          return const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          );
        });
  }
}
