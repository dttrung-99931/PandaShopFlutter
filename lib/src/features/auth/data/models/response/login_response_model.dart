// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/shop/data/models/response/shop_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class LoginResponseModel {
  final String token;
  final int userID;
  final int cartId;
  final ShopResponseModel? shop;

  LoginResponseModel({
    required this.token,
    required this.userID,
    required this.cartId,
    required this.shop,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}
