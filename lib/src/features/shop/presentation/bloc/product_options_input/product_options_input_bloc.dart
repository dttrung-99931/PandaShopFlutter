// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_option_input_dto.dart';
import 'package:evievm_app/src/shared/enums/edit_action.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'product_options_input_event.dart';
part 'product_options_input_state.dart';

ProductOptionsInputBloc get productOptionsInputBloc => getIt();

@lazySingleton
class ProductOptionsInputBloc extends BaseBloc with AddressBlocMixin {
  ProductOptionsInputBloc() : super(InitialState()) {
    on<OnAddPropertyForOption>(_onAddPropertyForOption);
    on<OnRemovePropertyForOption>(_onRemovePropertyForOption);
    on<OnAddProductOption>(_onAddProductOption);
    on<OnSelectProductOption>(_onSelect);
    on<OnInitProductOptions>(_onInitProductOptions);
  }

  final List<PropertyValuesDto> _optionProperties = [];
  List<PropertyValuesDto> get optionProperties => List.unmodifiable(_optionProperties);

  final List<ProductOptionInputDto> _productOptionInputs = [];
  ProductOptionInputDto? _selected;

  FutureOr<void> _onAddPropertyForOption(OnAddPropertyForOption event, Emitter<BaseState> emit) async {
    _optionProperties.add(event.prop);
    emit(OptionPropsUpdated(
      _optionProperties,
      propList: [event.prop],
      propAction: EditAction.add,
    ));
  }

  FutureOr<void> _onRemovePropertyForOption(OnRemovePropertyForOption event, Emitter<BaseState> emit) async {
    _optionProperties.removeWhere((element) => event.prop.id == element.id);
    emit(OptionPropsUpdated(
      _optionProperties,
      propList: [event.prop],
      propAction: EditAction.delete,
    ));
  }

  FutureOr<void> _onAddProductOption(OnAddProductOption event, Emitter<BaseState> emit) {
    ProductOptionInputDto option = ProductOptionInputDto.fromProps(_optionProperties);
    _productOptionInputs.add(option);
    if (_selected == null) {
      add(OnSelectProductOption(selected: option));
    }
    emit(ProductOptionsUpdated(_productOptionInputs, selected: _selected, editNameForSelected: false));
  }

  FutureOr<void> _onSelect(OnSelectProductOption event, Emitter<BaseState> emit) {
    _selected = event.selected;
    emit(ProductOptionsUpdated(
      _productOptionInputs,
      selected: event.selected,
      editNameForSelected: event.editNameForSelected,
    ));
  }

  FutureOr<void> _onInitProductOptions(OnInitProductOptions event, Emitter<BaseState> emit) async {
    if (event.options.isEmpty) {
      return;
    }
    _productOptionInputs.assignAll(
      event.options.mapList(
        (ProductOptionDto option) => ProductOptionInputDto(
          id: option.id,
          propTextControllerMap: Map.fromEntries(
            option.propertyValues.mapList(
              (element) => MapEntry(
                element.toPropertyValues(),
                TextEditingController(text: element.value),
              ),
            ),
          ),
        )
          ..nameTextController.text = option.name ?? ''
          ..priceController.text = option.price.toString(),
      ),
    );
    _optionProperties.assignAll(
      event.options.first.propertyValues.mapList((element) => element.toPropertyValues()),
    );
    _selected = _productOptionInputs.first;
    emit(ProductOptionsUpdated(_productOptionInputs, selected: _selected, editNameForSelected: false));
  }
}
