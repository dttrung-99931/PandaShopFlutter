// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';

class AddressDto extends Equatable {
  const AddressDto({
    required this.id,
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

  final int id;
  final String provinceOrCity;
  final String provinceOrCityCode;
  final String district;
  final String districtCode;
  final String communeOrWard;
  final String streetAndHouseNum;
  final String name;
  final double lat;
  final double long;

  String get address => "$provinceOrCity, $district, $communeOrWard, $streetAndHouseNum";
  String get shortAddress => "$provinceOrCity, $district";

  static AddressDto add = const AddressDto(
    id: -1,
    provinceOrCity: '',
    provinceOrCityCode: '',
    district: '',
    districtCode: '',
    communeOrWard: '',
    streetAndHouseNum: '',
    name: '',
    lat: 0,
    long: 0,
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
      lat: model.lat,
      long: model.long,
    );
  }

  @override
  List<Object?> get props => [id];
}
