// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductBatchInputDto {
  static int _idGen = 0;

  int? id;
  final int productInventoryInputId;
  final String? productOptionId;
  final String? warehouseInputId;
  final String? number;
  final DateTime? manufactureDate;
  final DateTime? expireDate;
  final DateTime? arriveDate;

  ProductBatchInputDto({
    required this.productInventoryInputId,
    this.productOptionId,
    this.warehouseInputId,
    this.number,
    this.manufactureDate,
    this.expireDate,
    this.arriveDate,
  }) : id = _idGen--;
}
