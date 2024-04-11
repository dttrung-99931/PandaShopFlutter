// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/warehouse_model.dart';

class WarehouseDto {
  final int? id;
  final AddressDto address;
  final String name;

  WarehouseDto({
    this.id,
    required this.address,
    required this.name,
  });

  factory WarehouseDto.fromModel(WarehouseModel model) {
    return WarehouseDto(
      address: AddressDto.fromModel(model.address),
      name: model.name,
      id: model.id,
    );
  }
}
