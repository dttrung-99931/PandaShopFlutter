import 'package:json_annotation/json_annotation.dart';
part 'search_products_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class SearchProductsRequestModel {
  final String q;
  SearchProductsRequestModel({required this.q});

  Map<String, dynamic> toJson() => _$SearchProductsRequestModelToJson(this);
}
