// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'warehouse_input_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class WarehouseInputModel {
  final int? id;
  final DateTime date;

  WarehouseInputModel({
    required this.id,
    required this.date,
  });

  factory WarehouseInputModel.fromJson(Map<String, dynamic> json) => _$WarehouseInputModelFromJson(json);
}
