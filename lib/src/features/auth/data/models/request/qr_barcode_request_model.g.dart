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
    QrBarCodeLoginRequestModel instance) {
  final val = <String, dynamic>{
    'user_type': instance.userType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('qr_token', instance.qrToken);
  writeNotNull('barcode', instance.barcode);
  return val;
}
