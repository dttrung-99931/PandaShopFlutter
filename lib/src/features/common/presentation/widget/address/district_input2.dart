// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:evievm_app/core/utils/app_colors.dart';
// import 'package:evievm_app/core/utils/constants.dart';
// import 'package:evievm_app/core/utils/dimensions.dart';
// import 'package:evievm_app/core/utils/extensions/list_extension.dart';
// import 'package:evievm_app/core/utils/log.dart';
// import 'package:evievm_app/core/utils/utils.dart';
// import 'package:evievm_app/src/config/theme.dart';
// import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
// import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
// import 'package:evievm_app/src/shared/widgets/custom_drop_down_button.dart';
// import 'package:flutter/material.dart';

// class CityOrDistrictInput extends StatefulWidget {
//   const CityOrDistrictInput({
//     Key? key,
//     this.isEditMode = true,
//     this.isRequired = true,
//     this.showTopDivider = true,
//     required this.addressBlocMixin,
//     this.customEmptyName,
//     this.hintColor = AppColors.blackLight,
//     this.onGetCitiesSuccess,
//     this.onSelectedChanged,
//     this.title = 'common.city_or_district',
//     this.titleFlex = 6,
//     this.hasRightSpace = true,
//     this.inputWidth,
//     this.enabled = true,
//   }) : super(key: key);

//   final bool isEditMode;
//   final bool isRequired;
//   final bool showTopDivider;
//   final AddressBlocMixin addressBlocMixin;
//   final String? customEmptyName;
//   final Color hintColor;
//   final Function()? onGetCitiesSuccess;
//   final Function()? onSelectedChanged;
//   final String title;
//   final int titleFlex;
//   final bool hasRightSpace;
//   final double? inputWidth;
//   final bool enabled;

//   @override
//   State<CityOrDistrictInput> createState() => _CityOrDistrictInputState();
// }

// class _CityOrDistrictInputState extends State<CityOrDistrictInput> {
//   bool _isValidated = false;

//   @override
//   Widget build(BuildContext context) {
//     return InfoInput(
//       inputWidth: widget.inputWidth,
//       titleFlex: widget.titleFlex,
//       hasRightSpace: widget.hasRightSpace,
//       showTopDivider: widget.showTopDivider,
//       isEditable: widget.isEditMode,
//       title: widget.title,
//       textDisplayWhenNotEditable: widget.addressBlocMixin.selectedCityOrDistrict.name,
//       showRequiredLabel: widget.isRequired,
//       bottomText: (_isValidated & widget.isRequired)
//           ? Validate.validateRequiredCondition(
//               widget.addressBlocMixin.selectedCityOrDistrict.id != Constatnts.idEmpty,
//               fieldName: widget.title,
//             )
//           : null,
//       bottomTextType: TextType.error,
//       customInput: CustomBlocBuilder<AddressBloc>(
//         bloc: widget.addressBlocMixin.addressBloc,
//         buildForStates: const [GetCitiesSuccess, LoadingCities],
//         loadingStateType: LoadingCities,
//         loadingSize: Dimensions.inputLoadingSize,
//         builder: (state) {
//           CityDto emptyCity = CityDto.empty.withName(widget.customEmptyName);
//           if (state is GetCitiesSuccess) {
//             if (!state.data.any((city) => city.id == CityDto.empty.id)) {
//               state.data.insert(0, emptyCity);
//             }
//             if (state.selected != null) {
//               widget.addressBlocMixin.selectedCityOrDistrict = state.selected!;
//               state.selectedId = null; // Clear selected
//               doOnBuildUICompleted(() {
//                 _validate(true);
//               });
//             }
//             widget.onGetCitiesSuccess?.call();
//           }

//           var data = state is GetCitiesSuccess ? state.data : [emptyCity];
//           var index = data.indexWhere((element) => element.id == widget.addressBlocMixin.selectedCityOrDistrict.id);
//           var itemSelected = index == -1 ? null : data[index];
//           if (!data.contains(itemSelected)) {
//             itemSelected = CityDto.empty;
//             data.assignAll([emptyCity]);
//           }
//           return CustomDropdownButton<CityDto>(
//             // Disable reuse state cause -> selectedItem no correct
//             key: GlobalKey(),
//             enabled: widget.enabled,
//             selectedItem: itemSelected,
//             onSelected: (cityOrDistrict) {
//               widget.addressBlocMixin.selectedCityOrDistrict = cityOrDistrict!;
//               widget.onSelectedChanged?.call();
//               logd(widget.addressBlocMixin.selectedCityOrDistrict.name);
//               doOnBuildUICompleted(() {
//                 _validate(true);
//               });
//             },
//             dataItems: data,
//             itemBuilder: (cityOrDistrict) {
//               return Container(
//                 padding: const EdgeInsets.all(8),
//                 child: Text(
//                   cityOrDistrict.name,
//                   style: textTheme.bodyMedium?.copyWith(
//                     color: cityOrDistrict.id == CityDto.empty.id ? widget.hintColor : EVMColors.blackLight,
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   void _validate(bool isValidated) {
//     setState(() {
//       _isValidated = isValidated;
//     });
//   }
// }
