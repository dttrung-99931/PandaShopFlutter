// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SubOrderRequestModelToJson(
    SubOrderRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['addressId'] = instance.addressId;
  val['deliveryMethodId'] = instance.deliveryMethodId;
  val['subOrderDetails'] =
      instance.subOrderDetails.map((e) => e.toJson()).toList();
  return val;
}

Map<String, dynamic> _$SubOrderDetailRequestModelToJson(
    SubOrderDetailRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['productOptionId'] = instance.productOptionId;
  val['discountPercent'] = instance.discountPercent;
  val['price'] = instance.price;
  val['productNum'] = instance.productNum;
  return val;
}
