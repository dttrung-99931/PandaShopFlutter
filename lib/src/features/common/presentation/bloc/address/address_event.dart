// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'address_bloc.dart';

class OnGetMyAddresses extends BaseEvent {
  final int? selectedId;
  OnGetMyAddresses({
    this.selectedId,
  });

  @override
  List<Object?> get props => [selectedId];
}

class OnInitInputAddress extends BaseEvent {
  final AddressBlocMixin addressBlocMixin;
  OnInitInputAddress({
    required this.addressBlocMixin,
  });

  @override
  List<Object?> get props => [addressBlocMixin];
}

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

class OnGetCommunesAndWard extends BaseEvent {
  final String districtCode;
  final String? selectedCode;
  OnGetCommunesAndWard({
    required this.districtCode,
    this.selectedCode,
  });

  @override
  List<Object?> get props => [districtCode, selectedCode];
}

class OnProvOrCitySelected extends BaseEvent {
  final AddressFieldDto provOrCity;
  OnProvOrCitySelected({
    required this.provOrCity,
  });
  @override
  List<Object?> get props => [provOrCity];
}

class OnDistrictSelected extends BaseEvent {
  final AddressFieldDto district;
  OnDistrictSelected({
    required this.district,
  });
  @override
  List<Object?> get props => [district];
}

class OnCommuneOrWardSelected extends BaseEvent {
  final AddressFieldDto communeOrWard;
  OnCommuneOrWardSelected({
    required this.communeOrWard,
  });
  @override
  List<Object?> get props => [communeOrWard];
}
