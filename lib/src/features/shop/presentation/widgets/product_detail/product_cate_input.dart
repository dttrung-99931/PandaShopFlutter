import 'package:evievm_app/src/features/product/domain/dto/product_category_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart';
import 'package:evievm_app/src/shared/widgets/common/custom_dropdown_input.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:evievm_app/src/shared/widgets/spacing_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCateInput extends StatelessWidget {
  const ProductCateInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Loại sản phẩm',
      child: SpacingColumn(
        spacing: 4.h,
        children: [
          CustomDropdownInput<ProductCategoryDto, int, GetProductCatesLv1Successs, ProductCateInputBloc>(
            title: 'Chọn nhóm sản phẩm',
            onSelected: (selected) {
              inputProductCateBloc.add(OnProductCateSelected(selected: selected));
            },
            nameGetter: (selected) {
              return selected.name;
            },
            enabled: shopProductDetailBloc.productDetail == null,
          ),
          CustomDropdownInput<ProductCategoryDto, int, GetProductCatesLv2Successs, ProductCateInputBloc>(
            title: 'Chọn loại sản phẩm',
            onSelected: (selected) {
              inputProductCateBloc.add(OnProductCateSelected(selected: selected));
            },
            nameGetter: (selected) {
              return selected.name;
            },
            enabled: shopProductDetailBloc.productDetail == null,
          ),
          CustomDropdownInput<ProductCategoryDto, int, GetProductCatesLv3Successs, ProductCateInputBloc>(
            title: 'Chọn phân loại',
            onSelected: (selected) {
              inputProductCateBloc.add(OnProductCateSelected(selected: selected));
            },
            nameGetter: (selected) {
              return selected.name;
            },
            enabled: shopProductDetailBloc.productDetail == null,
          ),
        ],
      ),
    );
  }
}
