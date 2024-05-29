import 'package:evievm_app/core/utils/validate.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescriptionInput extends StatelessWidget {
  const ProductDescriptionInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Thông tin sản phẩm',
      spacing: 8.h,
      child: InfoInput(
        controller: shopProductDetailBloc.descController,
        showTitle: false,
        paddingLeft: 0,
        paddingRight: 0,
        textInputHeight: 200.h,
        expandHeight: true,
        validator: (text) => Validate.validateRequired(text, fieldName: 'Thông tin sản phẩm'),
      ),
    );
  }
}
