import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/presentation/widget/address/address_input.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart';
import 'package:flutter/material.dart';

class ProductAddressInput extends StatelessWidget {
  const ProductAddressInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AddressInput(
      title: 'Sản phẩm gửi từ',
      onSelected: (AddressDto selected) {
        shopProductDetailBloc.productAddress = selected;
      },
    );
  }
}
