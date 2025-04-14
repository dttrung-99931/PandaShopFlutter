// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$OrderRequestModelToJson(OrderRequestModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'addressId': instance.addressId,
      'deliveryMethodId': instance.deliveryMethodId,
      'orderDetails': instance.orderDetails.map((e) => e.toJson()).toList(),
    };

Map<String, dynamic> _$OrderDetailRequestModelToJson(
        OrderDetailRequestModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'productOptionId': instance.productOptionId,
      'productNum': instance.productNum,
    };
