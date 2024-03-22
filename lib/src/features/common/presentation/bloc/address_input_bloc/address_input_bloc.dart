// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/src/bloc.dart';
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/features/common/data/models/request/save_address_model.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/save_my_address_usecase.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:injectable/injectable.dart';

part 'address_input_event.dart';
part 'address_input_state.dart';

@lazySingleton
class AddressInputBloc extends BaseBloc with AddressBlocMixin {
  AddressInputBloc(this._saveAddress) : super(InitialState()) {
    onLoad<OnSaveMyAddress>(_onSaveMyAddress);
  }
  final SaveMyAddressUseCase _saveAddress;

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
}
