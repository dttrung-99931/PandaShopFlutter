// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_cart_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpsertCartRequestModel _$UpsertCartRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpsertCartRequestModel(
      productOptionId: json['productOptionId'] as int,
      productNum: json['productNum'] as int,
    );

Map<String, dynamic> _$UpsertCartRequestModelToJson(
        UpsertCartRequestModel instance) =>
    <String, dynamic>{
      'productOptionId': instance.productOptionId,
      'productNum': instance.productNum,
    };
