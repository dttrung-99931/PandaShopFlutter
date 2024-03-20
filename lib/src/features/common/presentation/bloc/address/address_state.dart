// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'address_bloc.dart';

class GetMyAddressesSucess extends FullDataLoadedState<List<AddressDto>> {
  GetMyAddressesSucess(super.data);
}

class GetAddressessFieldsSuccess extends FullDataLoadedState<List<AddressFieldDto>> {
  String? selectedCode;
  AddressFieldDto? get selected => data.firstWhereOrNull((p0) => p0.code == selectedCode);
  GetAddressessFieldsSuccess(super.data, {this.selectedCode});
}

class GetProvincesAndCitiesSucess extends GetAddressessFieldsSuccess {
  GetProvincesAndCitiesSucess(super.data, {super.selectedCode});
}

class GetCommunesAndWardsSuccess extends GetAddressessFieldsSuccess {
  GetCommunesAndWardsSuccess(super.data, {super.selectedCode});
}

class GetDistrictsSuccess extends GetAddressessFieldsSuccess {
  GetDistrictsSuccess(super.data, {super.selectedCode});
}


// class LoadingProducts extends LoadingState {}
