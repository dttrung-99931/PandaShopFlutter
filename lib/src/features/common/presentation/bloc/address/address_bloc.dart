// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_field_dto.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/get_communes_and_ward_usecase.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/get_district_usecase_usecase.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/get_my_addresses_usecase.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/get_provinces_and_cities_usecase.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';

import '../../../../../../core/base_bloc/base_event.dart';

part 'address_event.dart';
part 'address_state.dart';

AddressBloc get addressBloc => getIt<AddressBloc>();

@lazySingleton
class AddressBloc extends BaseBloc {
  final GetMyAddressesUseCase _getMyAddresses;
  final GetProvincesAndCitiesUseCase _getProvAndCities;
  final GetDistrictsUseCase _getDistricts;
  final GetCommunesAndWardsUseCase _getCommunesAndWards;

  AddressBloc(
    this._getMyAddresses,
    this._getProvAndCities,
    this._getDistricts,
    this._getCommunesAndWards,
  ) : super(InitialState()) {
    on<OnGetMyAddresses>(_onGetMyAddresses);
    on<OnGetProvinceAndCities>(_onGetProvinceAndCities);
  }

  Future<void> _onGetMyAddresses(OnGetMyAddresses event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getMyAddresses.call(noParam),
      emit: emit,
      onSuccess: (List<AddressDto> result) {
        return GetMyAddressesSucess(result);
      },
    );
  }

  Future<FutureOr<void>> _onGetProvinceAndCities(OnGetProvinceAndCities event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getProvAndCities.call(noParam),
      emit: emit,
      onSuccess: (List<AddressFieldDto> result) {
        return GetProvincesAndCitiesSucess(result);
      },
    );
  }
}
