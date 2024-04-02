// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_product_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopProductDetailBottomBar extends StatelessWidget {
  const ShopProductDetailBottomBar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.zero,
      child: SizedBox(
        height: 52.h,
        child: const _SaveButton(),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: CustomBlocConsumer<ShopProductDetailBloc>(
        listenForStates: const [CreateProductError, CreateProductSuccess, ValidateDataState],
        listener: (state) {
          if (state is CreateProductSuccess) {
            Global.pop();
            showSnackBar('Tạo sản phẩm thành công', SnackType.success);
            shopProductBloc.add(OnGetShopProducts());
            return;
          }

          if (state is ValidateDataState && state.shouldShowError) {
            showSnackBar('Vui lòng nhập đầy đủ thông tin', SnackType.fail);
            return;
          }
        },
        builder: (state) => CustomButton(
          isLoading: state is LoadingState,
          onPressed: () {
            shopProductDetailBloc.add(OnCreateProduct());
          },
          child: Text(
            "Lưu",
            style: textTheme.bodyLarge?.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

// 