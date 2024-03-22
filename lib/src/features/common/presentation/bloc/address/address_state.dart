// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'address_bloc.dart';

class GetMyAddressesSucess extends ListLoadedState<AddressDto, int> {
  GetMyAddressesSucess(super.data, {required super.selectedId});

  @override
  int getId(AddressDto element) {
    return element.id;
  }
}

class GetAddressessFieldsSuccess extends FullDataLoadedState<List<AddressFieldDto>> {
  GetAddressessFieldsSuccess(super.data, {required this.selectedCode});
  String selectedCode;
  AddressFieldDto get selected => data.firstWhere((p0) => p0.code == selectedCode);
  bool get isValid => selectedCode != '';
}

class GetProvincesAndCitiesSucess extends GetAddressessFieldsSuccess {
  GetProvincesAndCitiesSucess(super.data, {String? selectedCode})
      : super(
          selectedCode: selectedCode ?? AddressFieldDto.emptyProvOrCity.code,
        );
}

class GetCommunesAndWardsSuccess extends GetAddressessFieldsSuccess {
  GetCommunesAndWardsSuccess(super.data, {String? selectedCode})
      : super(
          selectedCode: selectedCode ?? AddressFieldDto.emptyComnuneOrWard.code,
        );
}

class GetDistrictsSuccess extends GetAddressessFieldsSuccess {
  GetDistrictsSuccess(super.data, {String? selectedCode})
      : super(
          selectedCode: selectedCode ?? AddressFieldDto.emptyDistrict.code,
        );
}


// class LoadingProducts extends LoadingState {}
