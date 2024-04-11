// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/warehouse_input_model.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/product_batch_input_dto.dart';

class ProductInventoryInpDto {
  static int _idGen = 0;
  final int id;
  int? productId;
  final List<ProductBatchInputDto> productBatches;
  final DateTime date = now;

  ProductInventoryInpDto({
    required this.productId,
    required this.productBatches,
  }) : id = _idGen--;

  WarehouseInputModel toRequestModel() {
    return WarehouseInputModel(id: null, date: date);
  }
}
