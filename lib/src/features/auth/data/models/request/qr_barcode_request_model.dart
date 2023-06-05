import 'package:json_annotation/json_annotation.dart';
part 'qr_barcode_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class QrBarCodeLoginRequestModel {
  @JsonKey(name: 'user_type')
  final String userType;
  @JsonKey(name: 'qr_token')
  final String? qrToken;
  @JsonKey(name: 'barcode')
  final String? barcode;

  QrBarCodeLoginRequestModel({
    required this.userType,
    this.qrToken,
    this.barcode,
  }) : assert(qrToken != barcode, 'qrToken and barcode can have value same time');

  Map<String, dynamic> toJson() => _$QrBarCodeLoginRequestModelToJson(this);
}
