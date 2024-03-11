// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabModel _$LabModelFromJson(Map<String, dynamic> json) => LabModel(
      name: json['name'] as String?,
      address: json['address'] as String?,
      code: json['code'] as String?,
      id: json['id'] as int?,
      sortOrder: json['sort_order'] as int?,
      labParentFlg: json['lab_parent_flg'] as bool?,
      parentLabId: json['parent_lab_id'] as int?,
      clinicSelectFlg: json['clinic_select_flg'] as bool?,
      labName: json['lab_name'] as String?,
      labNameF: json['lab_name_f'] as String?,
      labPhone: json['lab_phone'] as String?,
      evinoteStatus: json['evinote_status'] as bool?,
      evmStatus: json['evm_status'] as bool?,
    );

Map<String, dynamic> _$LabModelToJson(LabModel instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'code': instance.code,
      'id': instance.id,
      'sort_order': instance.sortOrder,
      'lab_parent_flg': instance.labParentFlg,
      'parent_lab_id': instance.parentLabId,
      'clinic_select_flg': instance.clinicSelectFlg,
      'lab_name': instance.labName,
      'lab_name_f': instance.labNameF,
      'lab_phone': instance.labPhone,
      'evinote_status': instance.evinoteStatus,
      'evm_status': instance.evmStatus,
    };
