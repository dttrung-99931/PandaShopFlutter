import 'package:json_annotation/json_annotation.dart';
part 'shop_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class ShopRequestModel {
  final int? id;
  final String name;

  ShopRequestModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toJson() => _$ShopRequestModelToJson(this);
}
