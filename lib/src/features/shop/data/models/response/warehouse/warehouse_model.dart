// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';

part 'warehouse_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class WarehouseModel {
  final int? id;
  final AddressModel address;
  final String name;

  WarehouseModel({
    required this.id,
    required this.address,
    required this.name,
  });

  factory WarehouseModel.fromJson(Map<String, dynamic> json) => _$WarehouseModelFromJson(json);
}
