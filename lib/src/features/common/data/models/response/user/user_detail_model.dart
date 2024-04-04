// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/shop/data/models/response/shop_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_detail_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDetailModel {
  final int id;
  final String name;
  final String phone;
  final String email;
  final int cartId;
  final ShopResponseModel? shop;

  UserDetailModel(
    this.id,
    this.name,
    this.phone,
    this.email,
    this.cartId,
    this.shop,
  );

  factory UserDetailModel.fromJson(Map<String, dynamic> json) => _$UserDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailModelToJson(this);
}
