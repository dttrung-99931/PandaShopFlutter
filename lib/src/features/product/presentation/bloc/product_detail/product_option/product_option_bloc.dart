// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';

import '../../../../../../../core/base_bloc/base_event.dart';

part 'product_option_event.dart';
part 'product_option_state.dart';

ProductOptionBloc get productOptionBloc => getIt<ProductOptionBloc>();

@lazySingleton
class ProductOptionBloc extends BaseBloc {
  ProductOptionBloc() : super(InitialState()) {
    on<OnOptionPropSelectedChagned>(_onOptionPropSelectedChagned);
    on<OnInitProductOption>(_onGetProductDetailSuccess);
  }

  @override
  BlocCommunication? get blocCommunication => getIt<ProductOptionCommunication>();

  late ProductDetailDto _product;
  ProductOptionDto? get selectedOption => _selectedOption;
  ProductOptionDto? _selectedOption;
  late Map<String, String> _selectedPropValMap;
  late Map<String, List<SelectableValueDto>> _selectableValuesOfPropMap;

  double? get price => _selectedOption?.price;
  final int _productQuantity = 1;
  int get productQuantity => _productQuantity;

  Future<void> _onOptionPropSelectedChagned(OnOptionPropSelectedChagned event, Emitter<BaseState> emit) async {
    if (event.isSelected) {
      List<ProductOptionDto> selectableOptions = _product.options
          .where(
            (element) => element.propertyValuesMap[event.propertyName] == event.value,
          )
          .toList();
      _selectableValuesOfPropMap[event.propertyName]?.forEach((SelectableValueDto element) {
        element.isSelected = (element.value == event.value);
      });
      List<String> otherProps =
          _selectableValuesOfPropMap.keys.where((String propName) => propName != event.propertyName).toList();
      for (String propName in otherProps) {
        Set<String> values = selectableOptions.map((option) => option.propertyValuesMap[propName] ?? '').toSet();
        _selectableValuesOfPropMap[propName]?.forEach((SelectableValueDto element) {
          element.isSelectable = values.contains(element.value);
          element.isSelected = values.contains(element.value) && (_selectedPropValMap[propName] == element.value);
        });
      }
    }
    _selectedPropValMap[event.propertyName] = event.value;
    _selectedOption = _product.findOption(_selectedPropValMap);
    _onSelectedOptionPropMapChanged(emit);
  }

  void _onSelectedOptionPropMapChanged(Emitter<BaseState> emit) {
    emit(
      OptionSelectedChanged(
        selectablePropVals: {..._selectableValuesOfPropMap},
        selectedOption: _selectedOption,
      ),
    );
  }

  FutureOr<void> _onGetProductDetailSuccess(OnInitProductOption event, Emitter<BaseState> emit) {
    _product = event.productDetail;
    _selectableValuesOfPropMap = _product.getAllSelectableValsOfProps();
    _selectedOption = (event.selectedOptionId != null
            ? _product.options.firstWhereOrNull((p0) => p0.id == event.selectedOptionId)
            : null) ??
        _product.options.firstOrNull;
    if (_selectedOption != null) {
      _selectedPropValMap = _selectedOption!.propertyValuesMap;
      for (MapEntry<String, String> selected in _selectedPropValMap.entries) {
        _selectableValuesOfPropMap[selected.key]?.forEach(
          (SelectableValueDto selectable) => selectable.isSelected = selectable.value == selected.value,
        );
      }
    }
    _onSelectedOptionPropMapChanged(emit);
  }
}
