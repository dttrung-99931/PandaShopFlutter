// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'warehouse_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class WarehouseRequestModel {
  final int? id;
  final int addressId;
  final String name;

  WarehouseRequestModel({
    required this.id,
    required this.addressId,
    required this.name,
  });

  Map<String, dynamic> toJson() => _$WarehouseRequestModelToJson(this);
}
