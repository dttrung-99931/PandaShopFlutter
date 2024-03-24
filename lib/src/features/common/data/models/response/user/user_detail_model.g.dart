// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailModel _$UserDetailModelFromJson(Map<String, dynamic> json) => UserDetailModel(
      json['name'] as String,
      json['phone'] as String,
      json['email'] as String,
      json['password'] as String,
      json['cartId'] as int,
      json['shop'] == null ? null : ShopResponseModel.fromJson(json['shop'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDetailModelToJson(UserDetailModel instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'cartId': instance.cartId,
      'shop': instance.shop?.toJson(),
    };
