import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/presentation/widget/address/address_input.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_product_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';

class ProductAddressInput extends StatelessWidget {
  const ProductAddressInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<ShopProductDetailBloc>(
      buildForStates: const [InitShopProductSuccess],
      builder: (state) {
        if (state is! InitShopProductSuccess) {
          return emptyWidget;
        }
        return AddressInput(
          title: 'Sản phẩm gửi từ',
          initSelectedId: state.productDetail?.addressId,
          onSelected: (AddressDto selected) {
            shopProductDetailBloc.addressId = selected.id;
          },
        );
      },
    );
  }
}
