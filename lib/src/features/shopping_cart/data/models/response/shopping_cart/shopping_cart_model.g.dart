// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingCartModel _$ShoppingCartModelFromJson(Map<String, dynamic> json) =>
    ShoppingCartModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int,
    );

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: json['id'] as int,
      productNum: json['productNum'] as int,
      productOption: ProductOptionModel.fromJson(
          json['productOption'] as Map<String, dynamic>),
      shortProduct: ShortProductModel.fromJson(
          json['shortProduct'] as Map<String, dynamic>),
      shop: ShopResponseModel.fromJson(json['shop'] as Map<String, dynamic>),
      deliveryMethods: (json['deliveryMethods'] as List<dynamic>)
          .map((e) => DeliveryMethodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
