// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_option_input_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/product_inventory/product_batch_input_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/product_inventory/product_inventory_inp_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart';
import 'package:evievm_app/src/shared/widgets/common/adding_pannel.dart';
import 'package:evievm_app/src/shared/widgets/common/app_icon_button.dart';
import 'package:evievm_app/src/shared/widgets/common/custom_dropdown_input.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:evievm_app/src/shared/widgets/spacing_row.dart';
import 'package:evievm_app/src/shared/widgets/text_input.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InventoryProductSelect(productInventoryInpId: widget.inventoryInput.id),
          16.shb,
          ...widget.inventoryInput.productBatches.mapList(
            (element) => _InventoryProductOptionSelect(productBatch: element),
          ),
          16.shb,
          AddingPannel(
            height: 100.h,
            title: 'Nhập thêm tuỳ chọn',
            onPressed: () {
              productBatchInpBloc.add(OnAddProductBatchInput(
                productId: widget.inventoryInput.productId!,
                productInventoryId: widget.inventoryInput.id,
              ));
            },
          ),
          16.shb,

          // sh(12.h),
          // const _ProductOptionInputsTab(),
        ],
      ),
    );
  }
}

class _InventoryProductSelect extends StatefulWidget {
  const _InventoryProductSelect({
    Key? key,
    required this.productInventoryInpId,
  }) : super(key: key);
  final int productInventoryInpId;

  @override
  State<_InventoryProductSelect> createState() => _InventoryProductSelectState();
}

class _InventoryProductSelectState extends State<_InventoryProductSelect> {
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
      title: 'Sản phẩm nhập',
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

class _InventoryProductOptionSelect extends StatefulWidget {
  const _InventoryProductOptionSelect({
    Key? key,
    required this.productBatch,
  }) : super(key: key);
  final ProductBatchInputDto productBatch;

  @override
  State<_InventoryProductOptionSelect> createState() => _InventoryProductOptionSelectState();
}

class _InventoryProductOptionSelectState extends State<_InventoryProductOptionSelect> {
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

class _ProductOptionName extends StatefulWidget {
  const _ProductOptionName({
    required this.option,
    required this.isSelected,
    this.initFocusEditName = false,
  });

  final ProductOptionInputDto option;
  final bool isSelected;
  final bool initFocusEditName;

  @override
  State<_ProductOptionName> createState() => _ProductOptionNameState();
}

class _ProductOptionNameState extends State<_ProductOptionName> {
  late bool _enableEdit = widget.initFocusEditName;
  late final FocusNode _focusNode = FocusNode(canRequestFocus: _enableEdit)..addListener(_onFocusChanged);

  @override
  void initState() {
    _handleInitFocus();
    super.initState();
  }

  void _handleInitFocus() {
    _enableEdit = widget.initFocusEditName;
    _focusNode.canRequestFocus = widget.initFocusEditName;
    if (widget.initFocusEditName) {
      _focusNode.requestFocus();
    }
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus) {
      _focusNode.canRequestFocus = false;
    }
  }

  @override
  void didUpdateWidget(covariant _ProductOptionName oldWidget) {
    _handleInitFocus();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: TextInput(
        textInputAction: TextInputAction.next,
        focusNode: _focusNode,
        style: textTheme.bodyMedium,
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        disableColor: AppColors.white,
        controller: widget.option.nameTextController,
        hintText: 'Tên tùy chọn',
        borderColor: widget.isSelected ? AppColors.primary : AppColors.borderDark,
        onTap: () {
          productOptionsInputBloc.add(OnSelectProductOption(selected: widget.option));
        },
        suffixIcon: AppIconButton(
          iconData: Icons.edit,
          color: AppColors.blackLight,
          size: 20.r,
          // padding: EdgeInsets.zero,
          onPressed: () {
            productOptionsInputBloc.add(
              OnSelectProductOption(selected: widget.option, editNameForSelected: true),
            );
          },
        ),
      ),
    );
  }
}
