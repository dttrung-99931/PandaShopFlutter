// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailLoginRequestModel _$EmailLoginRequestModelFromJson(
        Map<String, dynamic> json) =>
    EmailLoginRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
      userType: json['user_type'] as String,
    );

Map<String, dynamic> _$EmailLoginRequestModelToJson(
        EmailLoginRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'user_type': instance.userType,
    };
