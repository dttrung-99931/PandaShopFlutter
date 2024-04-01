import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:evievm_app/src/shared/widgets/text_input.dart';
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
      child: TextInput(
        controller: shopProductDetailBloc.descController,
        height: 200.h,
        textInputAction: TextInputAction.newline,
        borderColor: AppColors.border,
        expandHeight: true,
      ),
    );
  }
}
