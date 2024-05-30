// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/common/data/models/request/save_address_model.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/get_map_place_detail_usecase.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/save_my_address_usecase.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:panda_map/core/models/map_place.dart';

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
  MapPlace? _selectedPlace; // hold houseNumber, lat, long that users search on map

  FutureOr<void> _onSaveMyAddress(OnSaveMyAddress event, Emitter<BaseState> emit) async {
    if (_selectedPlace == null) {
      emit(ErrorState(Failure(
        'Vui lòng nhập số nhà cụ thể (Bạn có thể chọn địa điểm lân cận nếu địa điểm mon muốn không tìm tháy)',
      )));
      return;
    }
    await handleUsecaseResult(
      usecaseResult: _saveAddress.call(SaveAddressRequestModel(
        provinceOrCity: selectedProvOrCity.name,
        provinceOrCityCode: selectedProvOrCity.code,
        district: selectedDistrict.name,
        districtCode: selectedDistrict.code,
        communeOrWard: selectedCommureOrWard.name,
        streetAndHouseNum: houseNumRoadNameController.text,
        name: addrNameController.text,
        lat: _selectedPlace!.location.lat,
        long: _selectedPlace!.location.long,
      )),
      emit: emit.call,
      onSuccess: (AddressDto result) {
        return SaveMyAddressSuccesss(result);
      },
    );
  }

  FutureOr<void> _onGetHouseNumberFromMapPlace(OnGetHouseNumberFromMapPlace event, Emitter<BaseState> emit) async {
    if (event.place.addressComponent != null) {
      houseNumRoadNameController.text = event.place.addressComponent!.streetAndHouseNum;
    } else {
      // TODO: address components may be not load together for other MapType.
      // So we need to get address compenents to extract house number
    }
    _selectedPlace = event.place;
  }
}
