// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_batch_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ProductBatchRequestModelToJson(
        ProductBatchRequestModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'productOptionId': instance.productOptionId,
      'warehouseInputId': instance.warehouseInputId,
      'number': instance.number,
      'manufactureDate': instance.manufactureDate.toIso8601String(),
      'expireDate': instance.expireDate.toIso8601String(),
      if (instance.arriveDate?.toIso8601String() case final value?)
        'arriveDate': value,
    };
