// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'get_product_cates_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class GetProductCatesRequestModel {
  final int? level;
  final int? parentId;
  final int? q;

  GetProductCatesRequestModel({
    this.level,
    this.parentId,
    this.q,
  });

  Map<String, dynamic> toJson() => _$GetProductCatesRequestModelToJson(this);
}
