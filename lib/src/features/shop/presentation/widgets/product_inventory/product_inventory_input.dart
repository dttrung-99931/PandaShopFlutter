// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/product_inventory_inp_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_inventory/product_batch_input.dart';
import 'package:evievm_app/src/shared/widgets/common/adding_pannel.dart';
import 'package:evievm_app/src/shared/widgets/common/custom_dropdown_input.dart';
import 'package:evievm_app/src/shared/widgets/common/horizontal_divider.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInventoryInput extends StatefulWidget {
  const ProductInventoryInput(this.inventoryInput, {super.key});
  final ProductInventoryInpDto inventoryInput;

  @override
  State<ProductInventoryInput> createState() => _ProductInventoryInputState();
}

class _ProductInventoryInputState extends State<ProductInventoryInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      margin: Section.defaultMargin.copyWith(right: 16.w, left: 16.w),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductSelect(productInventoryInpId: widget.inventoryInput.id),
          // TODO: add divider
          // Container(
          //   height: 1.h,
          //   color: AppColors.border,
          //   width: double.infinity,
          // ),
          16.shb,
          ...widget.inventoryInput.productBatches
              .mapList<Widget>(
                (element) => ProductBatchInput(productBatch: element),
              )
              .addBetweenEvery(
                HorizontalDivider(
                  paddingHorizontal: 0,
                  paddingVertical: 4.h,
                  color: AppColors.divider,
                ),
              ),
          16.shb,
          AddingPannel(
            height: 100.h,
            title: 'Nhập thêm tuỳ chọn',
            onPressed: () {
              if (widget.inventoryInput.productId == null) {
                showSnackBar('Vui lòng chọn sản phẩm trước!', SnackType.fail);
                return;
              }
              productBatchInpBloc.add(OnAddProductBatchInput(
                productId: widget.inventoryInput.productId!,
                productInventoryId: widget.inventoryInput.id,
              ));
            },
          ),
        ],
      ),
    );
  }
}

class _ProductSelect extends StatefulWidget {
  const _ProductSelect({
    Key? key,
    required this.productInventoryInpId,
  }) : super(key: key);
  final int productInventoryInpId;

  @override
  State<_ProductSelect> createState() => _ProductSelectState();
}

class _ProductSelectState extends State<_ProductSelect> {
  @override
  void initState() {
    productInventoryInpBloc.add(
      OnGetProdsToSelect(
        productInventoryInpId: widget.productInventoryInpId,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdownInput<ProductDto, int, GetProdsToSelectSucess, ProductInventoryInputBloc>(
      title: 'Sản phẩm',
      titleFlex: 7,
      boldTitle: true,
      onSelected: (ProductDto selected) {
        productInventoryInpBloc.add(OnProdSelected(
          productInventoryInpId: widget.productInventoryInpId,
          selectedProduct: selected,
        ));
      },
      buildCondition: (state) {
        return state is GetProdsToSelectSucess && state.productInventoryInpId == widget.productInventoryInpId;
      },
      nameGetter: (ProductDto selected) {
        return selected.name;
      },
    );
  }
}
