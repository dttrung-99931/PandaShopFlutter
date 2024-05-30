// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'save_address_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SaveAddressRequestModel {
  final String provinceOrCity;
  final String provinceOrCityCode;
  final String district;
  final String districtCode;
  final String communeOrWard;
  final String streetAndHouseNum;
  final String? name;
  final double lat;
  final double long;

  SaveAddressRequestModel({
    required this.provinceOrCity,
    required this.provinceOrCityCode,
    required this.district,
    required this.districtCode,
    required this.communeOrWard,
    required this.streetAndHouseNum,
    required this.name,
    required this.lat,
    required this.long,
  });

  factory SaveAddressRequestModel.fromJson(Map<String, dynamic> json) => _$SaveAddressRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveAddressRequestModelToJson(this);
}
