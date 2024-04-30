import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/core/utils/validate.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_field_dto.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressFieldInput<TState extends GetAddressessFieldsSuccess> extends StatefulWidget {
  const AddressFieldInput({
    super.key,
    required this.addrBlocMixin,
    required this.title,
    required this.onSelected,
    this.isEditMode = true,
    this.initLoadPrefs = false,
    this.showTopDivider = false,
    this.isRequired = false,
    this.customEmptyName,
    this.hintColor = EVMColors.blackLight,
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
  final bool hasRightSpace;
  final double? inputWidth;
  final double paddingRight;
  final bool enabled;
  final Function(AddressFieldDto selected) onSelected;

  @override
  State<AddressFieldInput> createState() => _AddressFieldInputState<TState>();
}

class _AddressFieldInputState<TState extends GetAddressessFieldsSuccess> extends State<AddressFieldInput> {
  bool _isValidated = false;
  AddressBlocMixin get addressMixin => widget.addrBlocMixin;

  void _validate(bool isValidated) {
    setState(() {
      _isValidated = isValidated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InfoInput(
      inputWidth: widget.inputWidth,
      hasRightSpace: widget.hasRightSpace,
      showTopDivider: widget.showTopDivider,
      isEditable: widget.isEditMode,
      title: widget.title,
      textDisplayWhenNotEditable: addressMixin.selectedProvOrCity.name,
      showRequiredLabel: widget.isRequired,
      bottomText: (_isValidated & widget.isRequired)
          ? Validate.validateRequiredCondition(
              addressMixin.selectedProvOrCity.code != Constants.codeEmpty,
              fieldName: widget.title,
            )
          : null,
      bottomTextType: TextType.error,
      customInput: CustomBlocBuilder<AddressBloc>(
          bloc: widget.addrBlocMixin.addressBloc,
          buildForStates: [TState],
          handleLoading: false,
          builder: (state) {
            if (state is! TState) {
              return const SizedBox.shrink();
            }
            if (state.isValid) {
              doOnBuildUICompleted(() {
                _validate(true);
              });
            }
            return CustomDropdownButton<AddressFieldDto>(
              height: 56.h,
              enabled: widget.enabled,
              selectedItem: state.selected,
              onSelected: (AddressFieldDto? field) {
                if (field == null) {
                  return;
                }
                widget.onSelected(field);
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
                      color: state.isValid ? widget.hintColor : EVMColors.blackLight,
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
