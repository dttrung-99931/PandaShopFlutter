// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:panda_map/core/models/map_place.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/features/common/data/models/request/save_address_model.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/get_map_place_detail_usecase.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/save_my_address_usecase.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:panda_map/core/models/map_place_detail.dart';

part 'address_input_event.dart';
part 'address_input_state.dart';

@lazySingleton
class AddressInputBloc extends BaseBloc with AddressBlocMixin {
  AddressInputBloc(
    this._saveAddress,
    this._getPlaceDetail,
  ) : super(InitialState()) {
    onLoad<OnSaveMyAddress>(_onSaveMyAddress);
    on<OnGetHouseNumberFromMapPlace>(_onGetHouseNumberFromMapPlace);
  }
  final SaveMyAddressUseCase _saveAddress;
  // Get placeDetail.addressCompoenents => get houseNumber
  final GetMapPlaceDetailUseCase _getPlaceDetail;

  FutureOr<void> _onSaveMyAddress(OnSaveMyAddress event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _saveAddress.call(SaveAddressRequestModel(
        provinceOrCity: selectedProvOrCity.name,
        provinceOrCityCode: selectedProvOrCity.code,
        district: selectedDistrict.name,
        districtCode: selectedDistrict.code,
        communeOrWard: selectedCommureOrWard.name,
        streetAndHouseNum: selectedCommureOrWard.code,
        name: addrNameController.text,
      )),
      emit: emit,
      onSuccess: (AddressDto result) {
        return SaveMyAddressSuccesss(result);
      },
    );
  }

  FutureOr<void> _onGetHouseNumberFromMapPlace(OnGetHouseNumberFromMapPlace event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getPlaceDetail.call(event.place.placeId),
      emit: emit,
      onSuccess: (MapPlaceDetail result) {
        houseNumRoadNameController.text = 'house number';
      },
    );
  }
}
