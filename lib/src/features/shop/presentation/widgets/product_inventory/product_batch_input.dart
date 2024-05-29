// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/product_batch_input_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart';
import 'package:evievm_app/src/shared/widgets/common/custom_dropdown_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBatchInput extends StatelessWidget {
  const ProductBatchInput({
    super.key,
    required this.productBatch,
  });
  final ProductBatchInputDto productBatch;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProductOptionSelect(productBatch: productBatch),
        InfoInput(
          title: 'Số lượng',
          inputWidth: 200.w,
          controller: productBatch.numberController,
          hasRightSpace: false,
          paddingLeft: 0,
          paddingRight: 0,
          titleFlex: 10,
          inputAction: TextInputAction.next,
          inputType: TextInputType.number,
        ),
      ],
    );
  }
}

class _ProductOptionSelect extends StatefulWidget {
  const _ProductOptionSelect({
    required this.productBatch,
  });
  final ProductBatchInputDto productBatch;

  @override
  State<_ProductOptionSelect> createState() => _ProductOptionSelectState();
}

class _ProductOptionSelectState extends State<_ProductOptionSelect> {
  @override
  void initState() {
    productBatchInpBloc.add(
      OnGetProdOptionsToSelect(productBatchnInpId: widget.productBatch.id!),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdownInput<ProductOptionDto, int, GetProductOptsToSelectSucess, ProductBatchInputBloc>(
      title: 'Tuỳ chọn',
      onSelected: (ProductOptionDto selected) {
        productBatchInpBloc.add(
          OnProdOptionSelected(productBatchInpId: widget.productBatch.id!, selectedOption: selected),
        );
      },
      buildCondition: (state) {
        return state is GetProductOptsToSelectSucess && state.productBatchInpId == widget.productBatch.id;
      },
      nameGetter: (ProductOptionDto selected) {
        return selected.name ?? selected.propertyValues.mapList((element) => element.value).join(' ');
      },
    );
  }
}
