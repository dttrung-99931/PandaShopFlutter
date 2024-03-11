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
    UserProfileRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pass_chosse_manufacture', instance.passChooseManufacturer);
  return val;
}
