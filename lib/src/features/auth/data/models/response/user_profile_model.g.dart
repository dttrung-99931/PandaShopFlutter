// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      id: (json['id'] as num).toInt(),
      labId: (json['lab_id'] as num).toInt(),
      childLabId: (json['child_lab_id'] as num?)?.toInt(),
      clinicId: (json['clinic_id'] as num?)?.toInt(),
      userType: json['user_type'] as String,
      userRole: json['user_role'] as String,
      nameSei: json['name_sei'] as String,
      nameMei: json['name_mei'] as String,
      passwordLength: (json['password_length'] as num?)?.toInt(),
      qrToken: json['qr_token'] as String?,
      employeeBarcode: json['employee_barcode'] as String?,
      email: json['email'] as String,
      switchRole: json['switch_role'] as String?,
      paymentStatus: json['payment_status'] as String,
      withdraw: json['withdraw'],
      parentId: (json['parent_id'] as num?)?.toInt(),
      passCodeStatus: json['pass_code_status'] as bool,
      passCodeLength: (json['pass_code_length'] as num?)?.toInt(),
      passChooseManufacturer: json['pass_chosse_manufacture'] as bool,
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lab_id': instance.labId,
      'child_lab_id': instance.childLabId,
      'clinic_id': instance.clinicId,
      'user_type': instance.userType,
      'user_role': instance.userRole,
      'name_sei': instance.nameSei,
      'name_mei': instance.nameMei,
      'password_length': instance.passwordLength,
      'qr_token': instance.qrToken,
      'employee_barcode': instance.employeeBarcode,
      'email': instance.email,
      'switch_role': instance.switchRole,
      'payment_status': instance.paymentStatus,
      'withdraw': instance.withdraw,
      'parent_id': instance.parentId,
      'pass_code_status': instance.passCodeStatus,
      'pass_code_length': instance.passCodeLength,
      'pass_chosse_manufacture': instance.passChooseManufacturer,
    };
