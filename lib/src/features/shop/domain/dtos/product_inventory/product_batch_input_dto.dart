// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductBatchInputDto {
  static int _idGen = -1;

  int? id;
  final String? productOptionId;
  final String? warehouseInputId;
  final String? number;
  final DateTime? manufactureDate;
  final DateTime? expireDate;
  final DateTime? arriveDate;

  ProductBatchInputDto({
    this.productOptionId,
    this.warehouseInputId,
    this.number,
    this.manufactureDate,
    this.expireDate,
    this.arriveDate,
  }) : id = _idGen - 1;
}
