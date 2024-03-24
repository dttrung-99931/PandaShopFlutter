// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/shop/data/models/response/shop_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ShopResponseDto {
  final String name;
  final int id;

  ShopResponseDto({
    required this.name,
    required this.id,
  });
  factory ShopResponseDto.fromModel(ShopResponseModel model) {
    return ShopResponseDto(id: model.id, name: model.name);
  }
}
