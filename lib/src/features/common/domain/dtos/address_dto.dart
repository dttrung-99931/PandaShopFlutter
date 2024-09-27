// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class AddressDto extends Equatable {
  AddressDto({
    required this.id,
    required this.provinceOrCity,
    required this.provinceOrCityCode,
    required this.district,
    required this.districtCode,
    required this.communeOrWard,
    required this.streetAndHouseNum,
    required this.name,
  });

  final int id;
  final String provinceOrCity;
  final String provinceOrCityCode;
  final String district;
  final String districtCode;
  final String communeOrWard;
  final String streetAndHouseNum;
  final String name;

  String get address => "$provinceOrCity, $district, $communeOrWard, $streetAndHouseNum";
  static AddressDto add = AddressDto(
    id: -1,
    provinceOrCity: '',
    provinceOrCityCode: '',
    district: '',
    districtCode: '',
    communeOrWard: '',
    streetAndHouseNum: '',
    name: '',
  );

  factory AddressDto.fromModel(AddressModel model) {
    return AddressDto(
      id: model.id,
      provinceOrCity: model.provinceOrCity,
      provinceOrCityCode: model.provinceOrCityCode,
      district: model.district,
      districtCode: model.districtCode,
      communeOrWard: model.communeOrWard,
      streetAndHouseNum: model.streetAndHouseNum,
      name: model.name ?? '',
    );
  }

  @override
  List<Object?> get props => [id];
}
