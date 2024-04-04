// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopRequestModel _$ShopRequestModelFromJson(Map<String, dynamic> json) =>
    ShopRequestModel(
      id: json['id'] as int?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ShopRequestModelToJson(ShopRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  return val;
}
