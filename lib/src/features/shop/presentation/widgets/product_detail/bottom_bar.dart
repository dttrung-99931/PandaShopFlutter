// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_product_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopProductDetailBottomBar extends StatelessWidget {
  const ShopProductDetailBottomBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: double.infinity,
      child: Card(
        elevation: 8,
        margin: EdgeInsets.zero,
        child: CustomBlocBuilder<ShopProductDetailBloc>(
            buildForStates: const [InitShopProductSuccess],
            builder: (state) {
              if (state is! InitShopProductSuccess) {
                return emptyWidget;
              }
              return shopProductDetailBloc.isCreateMode ? const _CreateButton() : const _UpdateButton();
            }),
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton();

  @override
  Widget build(BuildContext context) {
    return CustomBlocConsumer<ShopProductDetailBloc>(
      listenForStates: const [
        CreateProductError,
        CreateProductSuccess,
        ValidateDataState,
      ],
      listener: (state) {
        if (state is CreateProductSuccess) {
          Global.pop();
          showSnackBar('Tạo sản phẩm thành công', SnackType.success);
          shopProductBloc.add(OnGetShopProducts());
          shopProductBloc.add(OnGetShopProductCates());
          return;
        }

        if (state is ValidateDataState) {
          if (state.isValidateToSubmit && state.isValid) {
            shopProductDetailBloc.add(OnCreateProduct());
            return;
          }

          if (state.shouldShowError) {
            showFailedSnackBar(state.message);
          }
        }
      },
      handleLoading: false,
      buildForStates: const [LoadingState<OnCreateProduct>],
      builder: (state) => CustomButton(
        isLoading: state is LoadingState<OnCreateProduct>,
        onPressed: () {
          shopProductDetailBloc.add(OnValidateData.validateToSubmit());
        },
        child: Text(
          "Tạo sản phẩm",
          style: textTheme.bodyLarge?.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton();

  @override
  Widget build(BuildContext context) {
    return CustomBlocConsumer<ShopProductDetailBloc>(
      listenForStates: const [
        UpdateProductError,
        UpdateProductSuccess,
        ValidateDataState,
      ],
      listener: (state) {
        if (state is UpdateProductSuccess) {
          Global.pop();
          showSnackBar('Cập nhật phẩm thành công', SnackType.success);
          productDetailBloc.add(OnGetProductDetail(shopProductDetailBloc.productDetail!.id));
          shopProductBloc.add(OnGetShopProducts());
          shopProductBloc.add(OnGetShopProductCates());
          return;
        }

        if (state is ValidateDataState) {
          if (state.isValidateToSubmit && state.isValid) {
            shopProductDetailBloc.add(OnUpdateProduct());
            return;
          }

          if (state.shouldShowError) {
            showFailedSnackBar(state.message);
          }
        }
      },
      buildForStates: const [LoadingState<OnUpdateProduct>],
      builder: (state) => CustomButton(
        isLoading: state is LoadingState<OnUpdateProduct>,
        onPressed: () {
          shopProductDetailBloc.add(OnValidateData.validateToSubmit());
        },
        child: Text(
          "Cập nhật",
          style: textTheme.bodyLarge?.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}

// 