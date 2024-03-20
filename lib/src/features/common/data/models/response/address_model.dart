// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressModel {
  final int id;
  final String provinceOrCity;
  final String provinceOrCityCode;
  final String district;
  final String districtCode;
  final String communeOrWard;
  final String streetAndHouseNum;
  final String? name;

  AddressModel(
    this.id,
    this.provinceOrCity,
    this.provinceOrCityCode,
    this.district,
    this.districtCode,
    this.communeOrWard,
    this.streetAndHouseNum,
    this.name,
  );

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
