// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'shopping_cart_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class ShoppingCartModel {
  List<CartProductMapModel> cartProducts;
  int id;

  ShoppingCartModel({
    required this.cartProducts,
    required this.id,
  });

  factory ShoppingCartModel.fromJson(Map<String, dynamic> json) => _$ShoppingCartModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
class CartProductMapModel {
  int productNum;
  CartProductModel product;
  int id;

  CartProductMapModel({
    required this.productNum,
    required this.product,
    required this.id,
  });

  factory CartProductMapModel.fromJson(Map<String, dynamic> json) => _$CartProductMapFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
class CartProductModel {
  final String name;
  final int starNum;
  final int sellingNum;
  final int remainingNum;
  final String? thumbImgLink;
  final int firstPrice;
  final String sentFrom;
  final int id;
  CartProductModel({
    required this.name,
    required this.starNum,
    required this.sellingNum,
    required this.remainingNum,
    this.thumbImgLink,
    required this.firstPrice,
    required this.sentFrom,
    required this.id,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) => _$CartProductFromJson(json);
}
