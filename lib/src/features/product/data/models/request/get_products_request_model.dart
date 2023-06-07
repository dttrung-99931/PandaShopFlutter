import 'package:json_annotation/json_annotation.dart';
part 'get_products_request_model.g.dart';

@JsonSerializable()
class GetProductsRequestModel {
  GetProductsRequestModel();

  Map<String, dynamic> toJson() => _$GetProductsRequestModelToJson(this);
}
