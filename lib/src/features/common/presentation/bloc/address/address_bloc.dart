// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_field_dto.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/get_communes_and_ward_usecase.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/get_district_usecase_usecase.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/get_my_addresses_usecase.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/get_provinces_and_cities_usecase.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/base_bloc/base_event.dart';

part 'address_event.dart';
part 'address_state.dart';

@injectable
class AddressBloc extends BaseBloc {
  final GetMyAddressesUseCase _getMyAddresses;
  final GetProvincesAndCitiesUseCase _getProvAndCities;
  final GetDistrictsUseCase _getDistricts;
  final GetCommunesAndWardsUseCase _getCommunesAndWards;
  late final AddressBlocMixin _addressBlocMixin;
  List<AddressFieldDto>? _provincesOrCities;
  List<AddressFieldDto>? _districts;
  List<AddressFieldDto>? _communesOrWards;

  AddressBloc(this._getMyAddresses, this._getProvAndCities, this._getDistricts, this._getCommunesAndWards)
      : super(InitialState()) {
    on<OnGetMyAddresses>(_onGetMyAddresses);
    on<OnInitInputAddress>(_onInitInputAddress);
    on<OnGetProvinceAndCities>(_onGetProvinceAndCities);
    on<OnGetDistricts>(_onGetDistricts);
    on<OnGetCommunesAndWard>(_onGetCommunesAndWard);
    on<OnProvOrCitySelected>(_onProvOrCitySelected);
    on<OnDistrictSelected>(_onDistrictSelected);
    on<OnCommuneOrWardSelected>(_onCommuneOrWardSelected);
  }

  Future<void> _onGetMyAddresses(OnGetMyAddresses event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getMyAddresses.call(noParam),
      emit: emit,
      onSuccess: (List<AddressDto> result) {
        return GetMyAddressesSucess([AddressDto.add, ...result], selectedId: event.selectedId);
      },
    );
  }

  Future<FutureOr<void>> _onGetProvinceAndCities(OnGetProvinceAndCities event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getProvAndCities.call(noParam),
      emit: emit,
      onSuccess: (List<AddressFieldDto> result) {
        GetProvincesAndCitiesSucess state = GetProvincesAndCitiesSucess([AddressFieldDto.emptyProvOrCity, ...result]);
        _addressBlocMixin.selectedProvOrCity = state.selected;
        _provincesOrCities = state.data;
        return state;
      },
    );
  }

  FutureOr<void> _onGetDistricts(OnGetDistricts event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getDistricts.call(event.provinceOrCityCode),
      emit: emit,
      onSuccess: (List<AddressFieldDto> result) {
        var state = GetDistrictsSuccess([AddressFieldDto.emptyDistrict, ...result], selectedCode: event.selectedCode);
        _addressBlocMixin.selectedDistrict = state.selected;
        _districts = state.data;
        return state;
      },
    );
  }

  FutureOr<void> _onGetCommunesAndWard(OnGetCommunesAndWard event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getCommunesAndWards.call(event.districtCode),
      emit: emit,
      onSuccess: (List<AddressFieldDto> result) {
        GetCommunesAndWardsSuccess state = GetCommunesAndWardsSuccess(
          [AddressFieldDto.emptyComnuneOrWard, ...result],
          selectedCode: event.selectedCode,
        );
        _addressBlocMixin.selectedCommureOrWard = state.selected;
        _communesOrWards = state.data;
        return state;
      },
    );
  }

  FutureOr<void> _onInitInputAddress(OnInitInputAddress event, Emitter<BaseState> emit) {
    _addressBlocMixin = event.addressBlocMixin;
    _provincesOrCities = null;
    _districts = null;
    _communesOrWards = null;
    emit(GetCommunesAndWardsSuccess([AddressFieldDto.emptyComnuneOrWard]));
    emit(GetDistrictsSuccess([AddressFieldDto.emptyDistrict]));
    add(OnGetProvinceAndCities());
  }

  FutureOr<void> _onProvOrCitySelected(OnProvOrCitySelected event, Emitter<BaseState> emit) async {
    if (_provincesOrCities == null) {
      return;
    }
    _addressBlocMixin.selectedProvOrCity = event.provOrCity;
    _addressBlocMixin.selectedCommureOrWard = AddressFieldDto.emptyComnuneOrWard;
    _addressBlocMixin.selectedDistrict = AddressFieldDto.emptyDistrict;
    emit(GetProvincesAndCitiesSucess(_provincesOrCities!, selectedCode: event.provOrCity.code));
    emit(GetCommunesAndWardsSuccess([AddressFieldDto.emptyComnuneOrWard]));
    if (event.provOrCity != AddressFieldDto.emptyProvOrCity) {
      add(OnGetDistricts(provinceOrCityCode: event.provOrCity.code));
    }
  }

  FutureOr<void> _onDistrictSelected(OnDistrictSelected event, Emitter<BaseState> emit) async {
    if (_districts == null) {
      return;
    }
    _addressBlocMixin.selectedDistrict = event.district;
    emit(GetDistrictsSuccess(_districts!, selectedCode: event.district.code));
    if (event.district != AddressFieldDto.emptyDistrict) {
      add(OnGetCommunesAndWard(districtCode: event.district.code));
    }
  }

  FutureOr<void> _onCommuneOrWardSelected(OnCommuneOrWardSelected event, Emitter<BaseState> emit) async {
    if (_communesOrWards == null) {
      return;
    }
    emit(GetCommunesAndWardsSuccess(_communesOrWards!, selectedCode: event.communeOrWard.code));
    _addressBlocMixin.selectedCommureOrWard = event.communeOrWard;
  }
}
