// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_batch_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ProductBatchRequestModelToJson(
    ProductBatchRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['productOptionId'] = instance.productOptionId;
  val['warehouseInputId'] = instance.warehouseInputId;
  val['number'] = instance.number;
  val['manufactureDate'] = instance.manufactureDate.toIso8601String();
  val['expireDate'] = instance.expireDate.toIso8601String();
  writeNotNull('arriveDate', instance.arriveDate?.toIso8601String());
  return val;
}
