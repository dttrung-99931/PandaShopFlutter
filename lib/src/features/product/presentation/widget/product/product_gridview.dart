import 'package:evievm_app/core/utils/dimensions.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/product_item.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';
import 'package:evievm_app/src/shared/widgets/not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView(
    this.products, {
    super.key,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.padding = EdgeInsets.zero,
  });
  final List<ProductDto> products;
  final ScrollPhysics physics;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? GridView.count(
            padding: padding,
            crossAxisCount: 2,
            childAspectRatio: Dimensions.productGridRatio,
            mainAxisSpacing: 8.r,
            crossAxisSpacing: 8.r,
            physics: physics,
            shrinkWrap: true,
            children: [...products.map((product) => ProductItem(product))],
          )
        : const NotFound();
  }
}
