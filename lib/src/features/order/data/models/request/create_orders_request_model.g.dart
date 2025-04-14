// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_orders_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateOrdersRequestModelToJson(
        CreateOrdersRequestModel instance) =>
    <String, dynamic>{
      'paymentMethodId': instance.paymentMethodId,
      if (instance.note case final value?) 'note': value,
      'orders': instance.orders.map((e) => e.toJson()).toList(),
    };
