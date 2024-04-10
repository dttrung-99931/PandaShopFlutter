// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/src/features/shop/domain/dtos/product_inventory/product_batch_input_dto.dart';

class ProductInventoryInpDto {
  static int _idGen = 0;
  final int id;
  int? productId;
  final List<ProductBatchInputDto> productBatches;
  final DateTime? date;

  ProductInventoryInpDto({
    required this.productId,
    required this.productBatches,
    this.date,
  }) : id = _idGen--;
}
