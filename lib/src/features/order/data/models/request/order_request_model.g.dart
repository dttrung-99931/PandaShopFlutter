// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$OrderRequestModelToJson(OrderRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['userId'] = instance.userId;
  val['paymentMethodId'] = instance.paymentMethodId;
  writeNotNull('note', instance.note);
  val['subOrders'] = instance.subOrders.map((e) => e.toJson()).toList();
  return val;
}
