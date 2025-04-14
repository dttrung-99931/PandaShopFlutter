// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_barcode_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrBarCodeLoginRequestModel _$QrBarCodeLoginRequestModelFromJson(
        Map<String, dynamic> json) =>
    QrBarCodeLoginRequestModel(
      userType: json['user_type'] as String,
      qrToken: json['qr_token'] as String?,
      barcode: json['barcode'] as String?,
    );

Map<String, dynamic> _$QrBarCodeLoginRequestModelToJson(
        QrBarCodeLoginRequestModel instance) =>
    <String, dynamic>{
      'user_type': instance.userType,
      if (instance.qrToken case final value?) 'qr_token': value,
      if (instance.barcode case final value?) 'barcode': value,
    };
