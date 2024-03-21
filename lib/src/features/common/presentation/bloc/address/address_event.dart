// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'address_bloc.dart';

class OnGetMyAddresses extends BaseEventWithoutProps {}

class OnGetProvinceAndCities extends BaseEventWithoutProps {}

class OnGetDistricts extends BaseEvent {
  final String provinceOrCityCode;
  final String? selectedCode;
  OnGetDistricts({
    required this.provinceOrCityCode,
    this.selectedCode,
  });

  @override
  List<Object?> get props => [provinceOrCityCode, selectedCode];
}
