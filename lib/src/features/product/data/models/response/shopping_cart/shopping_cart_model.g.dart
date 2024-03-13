// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingCartModel _$ShoppingCartModelFromJson(Map<String, dynamic> json) => ShoppingCartModel(
      items: (json['items'] as List<dynamic>).map((e) => CartItemModel.fromJson(e as Map<String, dynamic>)).toList(),
      id: json['id'] as int,
    );

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) => CartItemModel(
      productNum: json['productNum'] as int,
      productOptionId: json['productOptionId'] as int,
      shortProduct: ShortProductModel.fromJson(json['shortProduct'] as Map<String, dynamic>),
      id: json['id'] as int,
    );
