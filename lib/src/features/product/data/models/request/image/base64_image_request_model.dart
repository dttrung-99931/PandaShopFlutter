// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'base64_image_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class Base64ImageRequestModel {
  final int? id;
  final String based64Img;
  final int orderIndex;
  final String description;

  Base64ImageRequestModel({
    required this.id,
    required this.based64Img,
    required this.orderIndex,
    required this.description,
  });

  Map<String, dynamic> toJson() => _$Base64ImageRequestModelToJson(this);
}
