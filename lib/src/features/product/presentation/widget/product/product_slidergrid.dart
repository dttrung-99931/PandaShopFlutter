import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/dimensions.dart';
import '../../../../../shared/widgets/not_found.dart';
import '../../../domain/dto/product/product_dto.dart';
import 'product_item.dart';

class ProductSliverGrid extends StatelessWidget {
  final List<ProductDto> products;
  final EdgeInsets padding;
  final Function(ProductDto product)? onPressed;

  const ProductSliverGrid(
    this.products, {
    super.key,
    this.padding = EdgeInsets.zero,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? SliverPadding(
            padding: padding,
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: Dimensions.productGridRatio,
                mainAxisSpacing: 8.r,
                crossAxisSpacing: 8.r,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductItem(
                  product,
                  onPressed: onPressed,
                );
              },
            ),
          )
        : const NotFound(isSliver: true);
  }
}
