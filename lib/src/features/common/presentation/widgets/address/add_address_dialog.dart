// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_field_dto.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/widgets/address/address_field_input.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/shared/widgets/evm_dialog.dart';
import 'package:panda_map/core/models/map_place.dart';
import 'package:panda_map/widgets/search_bar/map_search_dialog.dart';

class AddAddrDialog extends StatefulWidget {
  const AddAddrDialog({
    super.key,
    this.onAddSuccessed,
  });
  final Function(AddressDto added)? onAddSuccessed;

  @override
  State<AddAddrDialog> createState() => _AddAddrDialogState();
}

class _AddAddrDialogState extends State<AddAddrDialog> {
  final addressInputBloc = getIt<AddressInputBloc>();

  @override
  void initState() {
    addressInputBloc.addressBloc.add(OnInitInputAddress(addressBlocMixin: addressInputBloc));
    super.initState();
  }

  @override
  void dispose() {
    getIt.resetLazySingleton<AddressInputBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: CustomBlocListener<AddressInputBloc>(
          listener: (state) {
            if (state is SaveMyAddressSuccesss) {
              widget.onAddSuccessed?.call(state.data);
              // Pop AddAddressDialog
              Global.pop();
              // Pop Address drop down
              Global.pop();
            }
          },
          child: AppDialog(
            width: .9.sw,
            title: 'Thêm địa chỉ',
            child: Column(
              children: [
                AddressFieldInput<GetProvincesAndCitiesSucess>(
                  addrBlocMixin: addressInputBloc,
                  title: 'Tỉnh/Thành phố',
                  onSelected: (AddressFieldDto selected) {
                    addressInputBloc.addressBloc.add(OnProvOrCitySelected(provOrCity: selected));
                  },
                ),
                AddressFieldInput<GetDistrictsSuccess>(
                  addrBlocMixin: addressInputBloc,
                  title: 'Quận/Huyện',
                  onSelected: (AddressFieldDto selected) {
                    addressInputBloc.addressBloc.add(OnDistrictSelected(district: selected));
                  },
                ),
                AddressFieldInput<GetCommunesAndWardsSuccess>(
                  addrBlocMixin: addressInputBloc,
                  title: 'Phường/Xã',
                  onSelected: (AddressFieldDto selected) {
                    addressInputBloc.addressBloc.add(OnCommuneOrWardSelected(communeOrWard: selected));
                  },
                ),
                InfoInput(
                  title: 'Số nhà, đường',
                  controller: addressInputBloc.houseNumRoadNameController,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => MapSearchDialog(
                        onSelected: (MapPlace place) {
                          addressInputBloc.add(OnGetHouseNumberFromMapPlace(place: place));
                          // Set houese num, lat, lng
                          Global.pop();
                        },
                        searchTextTransformer: (text) {
                          return '${addressInputBloc.addressComponents}, $text';
                        },
                      ),
                    );
                  },
                ),
                InfoInput(
                  title: 'Lưu địa chỉ với tên',
                  controller: addressInputBloc.addrNameController,
                ),
                8.shb,
                CustomBlocBuilder<AddressInputBloc>(
                  buildForStates: const [SaveMyAddressSuccesss],
                  builder: (state) {
                    return CustomButton(
                      isLoading: state is LoadingState,
                      title: 'Chọn và lưu',
                      onPressed: () {
                        addressInputBloc.add(OnSaveMyAddress());
                      },
                      elevation: 0,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
