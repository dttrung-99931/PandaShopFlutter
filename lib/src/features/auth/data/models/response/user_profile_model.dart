import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'lab_id')
  final int labId;
  @JsonKey(name: 'child_lab_id')
  final int? childLabId;
  @JsonKey(name: 'clinic_id')
  final int? clinicId;
  @JsonKey(name: 'user_type')
  final String userType;
  @JsonKey(name: 'user_role')
  final String userRole;
  @JsonKey(name: 'name_sei')
  final String nameSei;
  @JsonKey(name: 'name_mei')
  final String nameMei;
  @JsonKey(name: 'password_length')
  final int? passwordLength;
  @JsonKey(name: 'qr_token')
  final String? qrToken;
  @JsonKey(name: 'employee_barcode')
  final String? employeeBarcode;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'switch_role')
  final String? switchRole;
  @JsonKey(name: 'payment_status')
  final String paymentStatus;
  @JsonKey(name: 'withdraw')
  final dynamic withdraw;
  @JsonKey(name: 'parent_id')
  final int? parentId;
  @JsonKey(name: 'pass_code_status')
  final bool passCodeStatus;
  @JsonKey(name: 'pass_code_length')
  final int? passCodeLength;
  @JsonKey(name: 'pass_chosse_manufacture')
  final bool passChooseManufacturer;

  UserProfileModel({
    required this.id,
    required this.labId,
    this.childLabId,
    this.clinicId,
    required this.userType,
    required this.userRole,
    required this.nameSei,
    required this.nameMei,
    this.passwordLength,
    this.qrToken,
    this.employeeBarcode,
    required this.email,
    this.switchRole,
    required this.paymentStatus,
    this.withdraw,
    this.parentId,
    required this.passCodeStatus,
    required this.passCodeLength,
    required this.passChooseManufacturer,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}
