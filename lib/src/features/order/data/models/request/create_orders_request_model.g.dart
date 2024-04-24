// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_orders_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateOrdersRequestModelToJson(
    CreateOrdersRequestModel instance) {
  final val = <String, dynamic>{
    'paymentMethodId': instance.paymentMethodId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('note', instance.note);
  val['orders'] = instance.orders.map((e) => e.toJson()).toList();
  return val;
}
