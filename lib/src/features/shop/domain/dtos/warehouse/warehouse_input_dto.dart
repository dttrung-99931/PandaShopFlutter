// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/src/features/shop/data/models/response/warehouse/warehouse_input_model.dart';

class WarehouseInputDto {
  final int? id;
  final DateTime date;

  WarehouseInputDto({
    this.id,
    required this.date,
  });

  factory WarehouseInputDto.fromModel(WarehouseInputModel model) {
    return WarehouseInputDto(
      date: model.date,
      id: model.id,
    );
  }
}
