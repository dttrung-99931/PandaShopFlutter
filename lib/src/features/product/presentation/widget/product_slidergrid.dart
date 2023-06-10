import 'package:flutter/material.dart';

import '../../../../../core/utils/dimensions.dart';
import '../../../../shared/widgets/not_found.dart';
import '../../domain/dto/product_dto.dart';
import 'product_item.dart';

class ProductSliverGrid extends StatelessWidget {
  final List<ProductDto> products;
  final EdgeInsets padding;

  const ProductSliverGrid(
    this.products, {
    super.key,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? SliverPadding(
            padding: padding,
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: Dimensions.productGridRatio,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [...products.map((product) => ProductItem(product))],
            ),
          )
        : const NotFound(isSliver: true);
  }
}
