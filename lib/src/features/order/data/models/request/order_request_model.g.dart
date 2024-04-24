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
  val['addressId'] = instance.addressId;
  val['deliveryMethodId'] = instance.deliveryMethodId;
  val['orderDetails'] = instance.orderDetails.map((e) => e.toJson()).toList();
  return val;
}

Map<String, dynamic> _$OrderDetailRequestModelToJson(
    OrderDetailRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['productOptionId'] = instance.productOptionId;
  val['productNum'] = instance.productNum;
  return val;
}
