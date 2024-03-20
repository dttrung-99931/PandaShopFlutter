import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_field_dto.dart';
import 'package:flutter/widgets.dart';

import '../../../../../config/di/injection.dart';
import '../address/address_bloc.dart';

// Mixin for bloc need address input
mixin AddressBlocMixin on BaseBloc {
  final nameController = TextEditingController();
  final nameFuriganaController = TextEditingController();
  final phoneController = TextEditingController();
  final postalCodeController = TextEditingController();
  final addressController = TextEditingController();
  final buildingNameController = TextEditingController();
  final faxController = TextEditingController();
  final clinicCodeController = TextEditingController();
  final addressBloc = getIt<AddressBloc>();
  AddressFieldDto selectedProvOrCity = AddressFieldDto.empty; // slected tỉnh
  AddressFieldDto selectedDistrict = AddressFieldDto.empty;
  AddressFieldDto selectedCommureOrWard = AddressFieldDto.empty;

  // Future<void> onInitLabInfoInput(OnInitLabInfoInput event, Emitter<BaseState> emit) async {
  //   nameController.text = event.lab?.name ?? '';
  //   nameFuriganaController.text = event.lab?.nameF ?? '';
  //   phoneController.text = event.lab?.phone ?? '';
  //   postalCodeController.text = event.lab?.postalCode ?? '';
  //   addressController.text = event.lab?.address ?? '';
  //   buildingNameController.text = event.lab?.buildingName ?? '';
  //   clinicCodeController.text = event.lab?.clinicCode ?? '';
  //   faxController.text = event.lab?.fax ?? '';
  //   labId = event.lab?.id;
  //   initAddress(cityId: event.lab?.cityId, prefId: event.lab?.prefId);
  // }

  // void initAddress({int? cityId, int? prefId}) {
  //   if (isNullOrEmpty(cityId)) {
  //     selectedProvOrCity = AddressFieldDto.empty;
  //   }
  //   addressBloc.add(OnGetPrefs(selectedId: prefId));
  //   if (!isNullOrEmpty(prefId)) {
  //     addressBloc.add(OnGetCities(selectedId: cityId, prefId: prefId));
  //   } else {
  //     addressBloc.add(OnGetCities(prefId: AddressFieldDto.empty.id));
  //     selectedCityOrDistrict = CityDto.empty;
  //   }
  // }

  // bool isValidAddress() {
  //   return selectedCityOrDistrict.id != Constatnts.idEmpty && selectedProvOrCity.id != Constatnts.idEmpty;
  // }
}
