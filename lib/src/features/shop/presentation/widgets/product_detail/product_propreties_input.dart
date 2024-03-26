import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_category_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart';
import 'package:evievm_app/src/shared/widgets/common/custom_dropdown_input.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:evievm_app/src/shared/widgets/spacing_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPropertiesInput extends StatefulWidget {
  const ProductPropertiesInput({super.key});

  @override
  State<ProductPropertiesInput> createState() => _ProductPropertiesInputState();
}

class _ProductPropertiesInputState extends State<ProductPropertiesInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Thông số sản phẩm',
      child: CustomBlocBuilder<ProductPropertiesInputBloc>(
          buildForStates: const [GetPropTemplateSuccess],
          builder: (state) {
            if (state is! GetPropTemplateSuccess) {
              return emptyWidget;
            }
            return SpacingColumn(
              spacing: 4.h,
              children: state.data.properties.mapList(
                (PropertyValuesDto element) => InfoInput(
                  title: element.propertyName,
                  controller: state.textControllerMap[element.id],
                ),
              ),
            );
          }),
    );
  }
}
