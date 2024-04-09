// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'upsert_cart_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UpsertCartRequestModel {
  final int productOptionId;
  final int productNum;
  UpsertCartRequestModel({
    required this.productOptionId,
    required this.productNum,
  });

  Map<String, dynamic> toJson() => _$UpsertCartRequestModelToJson(this);
}
