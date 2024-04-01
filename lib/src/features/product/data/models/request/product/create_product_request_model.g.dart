// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateProductRequestModelToJson(
    CreateProductRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['description'] = instance.description;
  val['sellingNum'] = instance.sellingNum;
  val['categoryId'] = instance.categoryId;
  val['shopId'] = instance.shopId;
  val['addressId'] = instance.addressId;
  val['productOptions'] = instance.productOptions;
  val['properties'] = instance.properties;
  return val;
}

Map<String, dynamic> _$ProductOptionRequestModelToJson(
    ProductOptionRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['price'] = instance.price;
  val['properties'] = instance.properties;
  return val;
}

Map<String, dynamic> _$PropertyValueRequestModelToJson(
    PropertyValueRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['propertyId'] = instance.propertyId;
  val['value'] = instance.value;
  return val;
}
