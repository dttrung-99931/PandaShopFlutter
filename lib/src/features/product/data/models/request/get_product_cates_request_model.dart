// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'get_product_cates_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class GetProductCatesRequestModel {
  final int? level;
  final int? parentId;
  final int? q;
  // Filter cate of shop that created products in
  final int? shopId;

  GetProductCatesRequestModel({
    this.level,
    this.parentId,
    this.q,
    this.shopId,
  });

  Map<String, dynamic> toJson() => _$GetProductCatesRequestModelToJson(this);
}
