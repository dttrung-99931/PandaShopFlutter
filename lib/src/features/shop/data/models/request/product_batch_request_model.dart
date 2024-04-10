// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'product_batch_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class ProductBatchRequestModel {
  final int? id;
  final String productOptionId;
  final String warehouseInputId;
  final String number;
  final DateTime manufactureDate;
  final DateTime expireDate;
  final DateTime? arriveDate;

  ProductBatchRequestModel({
    required this.id,
    required this.productOptionId,
    required this.warehouseInputId,
    required this.number,
    required this.manufactureDate,
    required this.expireDate,
    this.arriveDate,
  });

  Map<String, dynamic> toJson() => _$ProductBatchRequestModelToJson(this);
}
