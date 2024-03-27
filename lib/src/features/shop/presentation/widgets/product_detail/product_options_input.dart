import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_option_input_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart';
import 'package:evievm_app/src/shared/widgets/common/adding_pannel.dart';
import 'package:evievm_app/src/shared/widgets/common/app_chip.dart';
import 'package:evievm_app/src/shared/widgets/common/app_icon_button.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
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
                        SingleChildScrollView(
                          child: SpacingRow(
                            spacing: 4.w,
                            children: state.data.mapList(
                              (ProductOptionInputDto element) => Container(
                                child: IntrinsicWidth(
                                  child: TextInput(
                                    // hasRightSpace: false,
                                    // paddingLeft: 0,
                                    // paddingRight: 0,
                                    controller: element.nameTextController,
                                    hintText: 'Tên tùy chọn',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              AppIconButton(
                title: '',
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
