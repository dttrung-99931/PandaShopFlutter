import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/validate.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_option_input_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart';
import 'package:evievm_app/src/shared/widgets/color_container.dart';
import 'package:evievm_app/src/shared/widgets/common/app_chip.dart';
import 'package:evievm_app/src/shared/widgets/common/app_icon_button.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:evievm_app/src/shared/widgets/spacing_row.dart';
import 'package:evievm_app/src/shared/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductOptionsInput extends StatefulWidget {
  const ProductOptionsInput({super.key});

  @override
  State<ProductOptionsInput> createState() => _ProductOptionsInputState();
}

class _ProductOptionsInputState extends State<ProductOptionsInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Tủy chọn sản phẩm',
      spacing: 8.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sh(4.h),
          const Text('Thông số tùy chọn'),
          sh(16.h),
          const _ProductOptionProps(),
          sh(16.h),
          const Text('Tùy chọn'),
          sh(12.h),
          const _ProductOptionInputsTab()
        ],
      ),
    );
  }
}

class _ProductOptionInputsTab extends StatelessWidget {
  const _ProductOptionInputsTab();

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<ProductOptionsInputBloc>(
      buildForStates: const [ProductOptionsUpdated],
      builder: (state) {
        if (state is! ProductOptionsUpdated) {
          return const _ProductOptionsTab(optionInputs: []);
        }
        return Column(
          children: [
            _ProductOptionsTab(optionInputs: state.data, selected: state.selected),
            sh(8.h),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                children: [
                  if (state.selected != null)
                    InfoInput(
                      titleFlex: 6,
                      title: 'Giá',
                      controller: state.selected!.priceController,
                      inputType: TextInputType.number,
                      titleStyle: textTheme.bodyMedium.bold(),
                      paddingRight: 8.w,
                      validator: (text) => Validate.validateRequired(text, fieldName: 'Giá'),
                    ),
                  if (state.selected != null)
                    ...state.selected!.propTextControllerMap.entries.mapList(
                      (MapEntry<PropertyValuesDto, TextEditingController> element) => InfoInput(
                        titleFlex: 6,
                        title: element.key.propertyName,
                        controller: element.value,
                        paddingRight: 8.w,
                      ),
                    ),
                  8.shb,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        elevation: 0,
                        title: 'Xóa',
                        backgroundColor: AppColors.red,
                        height: 40.h,
                        titleFontSize: 14.sp,
                        onPressed: () {},
                      ),
                      8.swb,
                      CustomButton(
                        elevation: 0,
                        title: 'Lưu',
                        height: 40.h,
                        titleFontSize: 14.sp,
                        onPressed: () {},
                      ),
                      8.swb,
                    ],
                  ),
                  4.shb,
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class _ProductOptionProps extends StatelessWidget {
  const _ProductOptionProps();

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<ProductOptionsInputBloc>(
      buildForStates: const [OptionPropsUpdated],
      builder: (state) {
        if (state is! OptionPropsUpdated) {
          return emptyWidget;
        }
        return Wrap(
          spacing: 8.w,
          runSpacing: 8.w,
          direction: Axis.horizontal,
          children: state.optionProps.mapList(
            (PropertyValuesDto element) => AppChip(
              label: element.propertyName,
              isOutlineColor: true,
              showClose: true,
              onIconPressed: () {
                productOptionsInputBloc.add(OnRemovePropertyForOption(prop: element));
              },
            ),
          ),
        );
      },
    );
  }
}

class _ProductOptionsTab extends StatelessWidget {
  const _ProductOptionsTab({required this.optionInputs, this.selected});
  final List<ProductOptionInputDto> optionInputs;
  final ProductOptionInputDto? selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SpacingRow(
              spacing: 8.w,
              children: optionInputs.mapList(
                (ProductOptionInputDto element) => _ProductOptionName(
                  isSelected: element == selected,
                  option: element,
                ),
              ),
            ),
          ),
        ),
        sw(8.w),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: AppIconButton(
            iconData: Icons.add,
            onPressed: () {
              productOptionsInputBloc.add(OnAddProductOption());
            },
            color: AppColors.blackLight,
          ),
        )
      ],
    );
  }
}

class _ProductOptionName extends StatefulWidget {
  const _ProductOptionName({
    required this.option,
    required this.isSelected,
    this.initEnabledEdit = false,
  });

  final ProductOptionInputDto option;
  final bool isSelected;
  final bool initEnabledEdit;

  @override
  State<_ProductOptionName> createState() => _ProductOptionNameState();
}

class _ProductOptionNameState extends State<_ProductOptionName> {
  late bool _enableEdit = widget.initEnabledEdit;
  late final FocusNode _focusNode = FocusNode(canRequestFocus: _enableEdit)..addListener(_onFocusChanged);

  void _onFocusChanged() {
    if (!_focusNode.hasFocus) {
      _focusNode.canRequestFocus = false;
    }
  }

  @override
  void didUpdateWidget(covariant _ProductOptionName oldWidget) {
    _enableEdit = widget.initEnabledEdit;
    _focusNode.canRequestFocus = _enableEdit;
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
            _focusNode.canRequestFocus = true;
            _focusNode.requestFocus();
          },
        ),
      ),
    );
  }
}
