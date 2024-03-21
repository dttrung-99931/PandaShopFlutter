import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/core/utils/validate.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_field_dto.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProvinceOrCityInput extends StatefulWidget {
  const ProvinceOrCityInput({
    super.key,
    this.isEditMode = true,
    required this.addrBlocMixin,
    this.initLoadPrefs = false,
    this.showTopDivider = false,
    this.isRequired = false,
    this.customEmptyName,
    this.hintColor = EVMColors.blackLight,
    this.title = 'Tỉnh/thành phố',
    this.titleFlex = 8,
    this.hasRightSpace = false,
    this.inputWidth,
    this.paddingRight = 16,
    this.enabled = true,
  });

  final bool isEditMode;
  final bool isRequired;
  final bool initLoadPrefs;
  final AddressBlocMixin addrBlocMixin;
  final bool showTopDivider;
  final String? customEmptyName;
  final Color hintColor;
  final String title;
  final int titleFlex;
  final bool hasRightSpace;
  final double? inputWidth;
  final double paddingRight;
  final bool enabled;

  @override
  State<ProvinceOrCityInput> createState() => _ProvinceOrCityInputState();
}

class _ProvinceOrCityInputState extends State<ProvinceOrCityInput> {
  bool _isValidated = false;
  AddressBlocMixin get addressMixin => widget.addrBlocMixin;

  @override
  void initState() {
    super.initState();
    addressMixin.addressBloc.add(OnGetProvinceAndCities());
    addressMixin.selectedProvOrCity = AddressFieldDto.emptyProvOrCity;
  }

  void _validate(bool isValidated) {
    setState(() {
      _isValidated = isValidated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InfoInput(
      inputWidth: widget.inputWidth,
      titleFlex: widget.titleFlex,
      hasRightSpace: widget.hasRightSpace,
      showTopDivider: widget.showTopDivider,
      isEditable: widget.isEditMode,
      title: widget.title,
      textDisplayWhenNotEditable: addressMixin.selectedProvOrCity.name,
      showRequiredLabel: widget.isRequired,
      bottomText: (_isValidated & widget.isRequired)
          ? Validate.validateRequiredCondition(
              addressMixin.selectedProvOrCity.code != Constatnts.codeEmpty,
              fieldName: widget.title,
            )
          : null,
      bottomTextType: TextType.error,
      customInput: Container(
        padding: EdgeInsets.only(right: widget.paddingRight),
        child: CustomBlocBuilder<AddressBloc>(
            // bloc: addressMixin.addressBloc,
            buildForStates: const [GetProvincesAndCitiesSucess],
            handleLoading: false,
            builder: (state) {
              if (state is! GetProvincesAndCitiesSucess) {
                return const SizedBox.shrink();
              }
              if (state.selected != null) {
                addressMixin.selectedProvOrCity = state.selected!;
                state.selectedCode = null; // Clear selected, only init selected on first load
                doOnBuildUICompleted(() {
                  _validate(true);
                });
              }
              if (!state.data.any((element) => element.code == AddressFieldDto.emptyProvOrCity.code)) {
                state.data.insert(0, AddressFieldDto.emptyProvOrCity);
              }
              return CustomDropdownButton<AddressFieldDto>(
                height: 56.h,
                enabled: widget.enabled,
                selectedItem: addressMixin.selectedProvOrCity,
                // onDropDrownClosed: () {
                //   _validate(true);
                // },
                onSelected: (AddressFieldDto? provOrCity) {
                  addressMixin.selectedProvOrCity = provOrCity!;
                  addressMixin.selectedDistrict = AddressFieldDto.emptyProvOrCity;
                  addressMixin.addressBloc.add(
                    OnGetDistricts(provinceOrCityCode: provOrCity.code),
                  );
                  doOnBuildUICompleted(() {
                    _validate(true);
                  });
                },
                dataItems: state.data,
                itemBuilder: (pref) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      pref.name,
                      style: textTheme.bodyMedium?.copyWith(
                        color:
                            pref.code == AddressFieldDto.emptyProvOrCity.code ? widget.hintColor : EVMColors.blackLight,
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
