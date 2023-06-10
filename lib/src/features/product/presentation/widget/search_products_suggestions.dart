import 'package:evievm_app/core/utils/dimensions.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_category_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/not_found.dart';
import '../../domain/dto/product_dto.dart';
import '../bloc/search/search_products_bloc.dart';

class SearchProductsSuggestions extends StatelessWidget {
  final SearchProductsSucess suggestion;
  const SearchProductsSuggestions(this.suggestion, {super.key});

  @override
  Widget build(BuildContext context) {
    return suggestion.isEmpty
        ? const NotFound(isSliver: true)
        : SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: EVMColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...suggestion.data.categories.map((e) => _CategorySuggestionItem(e)),
                  ...suggestion.data.products.map((e) => _ProductSuggestionItem(e)),
                ].addBetweenEvery(
                  Divider(
                    height: 1.h,
                    thickness: 1.h,
                    color: EVMColors.lightGrey,
                  ),
                ),
              ),
            ),
          );
  }
}

class _CategorySuggestionItem extends StatelessWidget {
  final ProductCategoryDto category;
  const _CategorySuggestionItem(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<SearchProductsBloc>().add(OnGetProducts(category: category));
      },
      child: Padding(
        padding: Dimensions.paddingAll,
        child: Text(category.name),
      ),
    );
  }
}

class _ProductSuggestionItem extends StatelessWidget {
  final ProductDto product;
  const _ProductSuggestionItem(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<SearchProductsBloc>().add(OnGetProducts(q: product.name));
      },
      child: Padding(
        padding: Dimensions.paddingAll,
        child: Text(product.name),
      ),
    );
  }
}
