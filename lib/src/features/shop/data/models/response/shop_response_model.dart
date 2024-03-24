// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'shop_response_model.g.dart';

@JsonSerializable()
class ShopResponseModel {
  final String name;
  final int id;

  ShopResponseModel({
    required this.name,
    required this.id,
  });

  factory ShopResponseModel.fromJson(Map<String, dynamic> json) => _$ShopResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShopResponseModelToJson(this);
}
