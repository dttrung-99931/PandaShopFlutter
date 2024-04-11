// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'warehouse_input_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class WarehouseInputRequestModel {
  final int? id;
  final int warehouseId;
  final DateTime date;

  WarehouseInputRequestModel({
    required this.id,
    required this.warehouseId,
    required this.date,
  });

  Map<String, dynamic> toJson() => _$WarehouseInputRequestModelToJson(this);
}
