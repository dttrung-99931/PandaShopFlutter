import 'package:json_annotation/json_annotation.dart';
part 'get_products_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class GetProductsRequestModel {
  final String? q;
  final int? categoryIdLV1;
  final int? categoryIdLV2;
  final int? categoryIdLV3;

  GetProductsRequestModel({
    this.categoryIdLV1,
    this.categoryIdLV2,
    this.categoryIdLV3,
    this.q,
  });

  Map<String, dynamic> toJson() => _$GetProductsRequestModelToJson(this);
}
