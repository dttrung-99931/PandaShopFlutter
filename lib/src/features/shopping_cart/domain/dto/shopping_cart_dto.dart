// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:evievm_app/core/utils/constants.dart';

import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_detail_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/delivery_method_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/shop_response_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/data/models/response/shopping_cart/shopping_cart_model.dart';
import 'package:evievm_app/src/shared/models/selectable.dart';

class ShoppingCartDto extends Equatable {
  const ShoppingCartDto({
    required this.id,
    required this.items,
  });
  final int id;
  final List<CartItemDto> items;
  List<CartItemDto> get selectedItems => items.where((element) => element.isSelected).toList();
  int get totalItems => items.length;

  factory ShoppingCartDto.fromModel(ShoppingCartModel model) {
    return ShoppingCartDto(id: model.id, items: model.items.mapList((element) => CartItemDto.fromModel(element)));
  }

  ShoppingCartDto copyWith({
    int? id,
    List<CartItemDto>? items,
  }) {
    return ShoppingCartDto(
      id: id ?? this.id,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [id, items];
}

class CartItemDto extends Selectable {
  final int productNum;
  final ProductOptionDto prouductOption;
  final ProductDto product;
  final ShopDto shop;
  final List<DeliveryMethodDto> deliveryMethods;
  final int id;

  CartItemDto({
    required this.id,
    required this.productNum,
    required this.prouductOption,
    required this.product,
    required this.shop,
    required this.deliveryMethods,
    super.isSelected,
  });

  factory CartItemDto.fromModel(CartItemModel model) {
    return CartItemDto(
      id: model.id,
      productNum: model.productNum,
      prouductOption: ProductOptionDto.fromModel(model.productOption),
      product: ProductDto.fromModel(model.shortProduct),
      shop: ShopDto.fromModel(model.shop),
      deliveryMethods: model.deliveryMethods.mapList((element) => DeliveryMethodDto.fromModel(element)),
    );
  }

  @override
  get selectId => id;

  CartItemDto copyWith({
    int? productNum,
    ProductOptionDto? prouductOption,
    ProductDto? product,
    ShopDto? shop,
    List<DeliveryMethodDto>? deliveryMethods,
    int? id,
  }) {
    return CartItemDto(
      productNum: productNum ?? this.productNum,
      prouductOption: prouductOption ?? this.prouductOption,
      product: product ?? this.product,
      shop: shop ?? this.shop,
      deliveryMethods: deliveryMethods ?? this.deliveryMethods,
      id: id ?? this.id,
    );
  }

  factory CartItemDto.from({required OrderDetailDto subOrderDetail, required ShopDto shop}) {
    return CartItemDto(
      id: Constants.idEmpty,
      productNum: subOrderDetail.productNum,
      prouductOption: subOrderDetail.productOption,
      product: subOrderDetail.product,
      shop: shop,
      deliveryMethods: const [],
    );
  }
}
