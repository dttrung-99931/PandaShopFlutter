import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_option_input_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart';
import 'package:evievm_app/src/shared/widgets/color_container.dart';
import 'package:evievm_app/src/shared/widgets/common/adding_pannel.dart';
import 'package:evievm_app/src/shared/widgets/common/app_chip.dart';
import 'package:evievm_app/src/shared/widgets/common/app_icon_button.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:evievm_app/src/shared/widgets/spacing_column.dart';
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
          CustomBlocBuilder<ProductOptionsInputBloc>(
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
          ),
          sh(16.h),
          const Text('Tùy chọn'),
          sh(8.h),
          // AddingPannel(
          //   title: 'Thêm tùy chọn',
          //   onPressed: () {
          //   },
          //   height: 108.h,
          // ),
          // sh(8.h),
          Row(
            children: [
              Expanded(
                child: CustomBlocBuilder<ProductOptionsInputBloc>(
                  buildForStates: const [ProductOptionsUpdated],
                  builder: (state) {
                    if (state is! ProductOptionsUpdated) {
                      return emptyWidget;
                    }
                    return Column(
                      children: [
                        _ProductOptionsTab(optionInputs: state.data),
                        CustomBlocBuilder<ProductOptionsInputBloc>(
                            buildForStates: [Product],
                            builder: (state) {
                              if (state != Product)
                                return SpacingColumn(
                                  spacing: 4.h,
                                  children: state.productProps.mapList(
                                    (PropertyValuesDto element) => Row(
                                      children: [
                                        Expanded(
                                          child: InfoInput(
                                            titleFlex: 8,
                                            title: element.propertyName,
                                            controller: state.textControllerMap[element.id],
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            productOptionsInputBloc.add(OnAddPropertyForOption(prop: element));
                                          },
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                              horizontal: 0.0,
                                            ),
                                            minimumSize: Size.zero,
                                          ),
                                          child: Text('Đặt tùy chọn',
                                              style: textTheme.bodySmall.withColor(AppColors.primary)),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                            })
                      ],
                    );
                  },
                ),
              ),
              AppIconButton(
                iconData: Icons.add,
                onPressed: () {
                  productOptionsInputBloc.add(OnAddProductOption());
                },
                color: AppColors.blackLight,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _ProductOptionsTab extends StatelessWidget {
  const _ProductOptionsTab({required this.optionInputs});
  final List<ProductOptionInputDto> optionInputs;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SpacingRow(
        spacing: 8.w,
        children: optionInputs.mapList(
          (ProductOptionInputDto element) => IntrinsicWidth(
            child: TextInput(
              height: 48.h,
              style: textTheme.bodyMedium,
              contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              disableColor: AppColors.white,
              enabled: false,
              controller: element.nameTextController..text = '32GB',
              hintText: 'Tên tùy chọn',
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 1.w),
                child: AppIconButton(
                  iconData: Icons.edit,
                  color: AppColors.blackLight,
                  size: 20.r,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
