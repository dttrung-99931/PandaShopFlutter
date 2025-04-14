// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileRequestModel _$UserProfileRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserProfileRequestModel(
      passChooseManufacturer: json['pass_chosse_manufacture'] as bool?,
    );

Map<String, dynamic> _$UserProfileRequestModelToJson(
        UserProfileRequestModel instance) =>
    <String, dynamic>{
      if (instance.passChooseManufacturer case final value?)
        'pass_chosse_manufacture': value,
    };
