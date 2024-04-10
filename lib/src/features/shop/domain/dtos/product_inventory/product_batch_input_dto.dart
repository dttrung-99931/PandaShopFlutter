// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductBatchInputDto {
  static int _idGen = 0;

  int? id;
  final int productId;
  final int productInventoryInputId;
  int? productOptionId;
  final int? warehouseInputId;
  final String? number;
  final DateTime? manufactureDate;
  final DateTime? expireDate;
  final DateTime? arriveDate;

  ProductBatchInputDto({
    required this.productInventoryInputId,
    required this.productId,
    this.productOptionId,
    this.warehouseInputId,
    this.number,
    this.manufactureDate,
    this.expireDate,
    this.arriveDate,
  }) : id = _idGen--;

  ProductBatchInputDto copyWith({
    int? productId,
    int? productInventoryInputId,
    int? productOptionId,
    int? warehouseInputId,
    String? number,
    DateTime? manufactureDate,
    DateTime? expireDate,
    DateTime? arriveDate,
  }) {
    return ProductBatchInputDto(
      productId: productId ?? this.productId,
      productInventoryInputId: productInventoryInputId ?? this.productInventoryInputId,
      productOptionId: productOptionId ?? this.productOptionId,
      warehouseInputId: warehouseInputId ?? this.warehouseInputId,
      number: number ?? this.number,
      manufactureDate: manufactureDate ?? this.manufactureDate,
      expireDate: expireDate ?? this.expireDate,
      arriveDate: arriveDate ?? this.arriveDate,
    );
  }
}
