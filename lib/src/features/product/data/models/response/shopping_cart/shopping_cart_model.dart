// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/product/data/models/response/product_model.dart';
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
  final int productOptionId;
  final ShortProductModel shortProduct;
  final int id;

  CartItemModel({
    required this.productNum,
    required this.productOptionId,
    required this.shortProduct,
    required this.id,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);
}
