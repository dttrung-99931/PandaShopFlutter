// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/product/data/models/response/product/delivery_method_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/product_detail_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/short_product_model.dart';
import 'package:evievm_app/src/features/shop/data/models/response/shop_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_cart_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class ShoppingCartModel {
  List<CartItemModel> items;
  int id;

  ShoppingCartModel({
    required this.items,
    required this.id,
  });

  factory ShoppingCartModel.fromJson(Map<String, dynamic> json) => _$ShoppingCartModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
class CartItemModel {
  final int productNum;
  final ProductOptionModel productOption;
  final ShortProductModel shortProduct;
  final ShopResponseModel shop;
  final List<DeliveryMethodModel> deliveryMethods;
  final int id;

  CartItemModel({
    required this.id,
    required this.productNum,
    required this.productOption,
    required this.shortProduct,
    required this.shop,
    required this.deliveryMethods,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);
}
