// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      token: json['token'] as String,
      userID: (json['userID'] as num).toInt(),
      cartId: (json['cartId'] as num).toInt(),
      shop: json['shop'] == null
          ? null
          : ShopResponseModel.fromJson(json['shop'] as Map<String, dynamic>),
    );
