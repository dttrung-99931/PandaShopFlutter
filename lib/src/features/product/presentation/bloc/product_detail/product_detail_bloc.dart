// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';

import '../../../../../../core/base_bloc/base_event.dart';
import '../../../domain/use_cases/get_product_detail_usecase.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

@lazySingleton
class ProductDetailBloc extends BaseBloc {
  final GetProductDetailUseCase _getProductDetailUsecase;

  late ProductDetailDto _product;

  double? get price => _selectedOption?.price;
  int _productQuantity = 1;

  ProductOptionDto? get selectedOption => _selectedOption;
  ProductOptionDto? _selectedOption;
  late Map<String, String> _selectedPropValMap;
  late Map<String, List<SelectableValueDto>> _selectableValuesOfPropMap;

  ProductDetailBloc(this._getProductDetailUsecase) : super(InitialState()) {
    onLoad<OnGetProductDetail>(
      _onGetProductDetail,
      loadingStateBuilder: (_) => LoadingProductDetail(),
    );
    on<OnOptionPropSelectedChagned>(_onOptionPropSelectedChagned);
  }

  Future<void> _onGetProductDetail(OnGetProductDetail event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getProductDetailUsecase.call(event.id),
      emit: emit,
      onSuccess: (ProductDetailDto? result) {
        return _onGetProductDetailSuccess(result, emit);
      },
    );
  }

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
        // _selectableValuesOfPropMap[propName] = values.map((value) {
        //   return SelectableValueDto(
        //     value,
        //     isSelectable: true,
        //     isSelected: _selectedPropValMap[propName] == value,
        //   );
        // }).toList();
      }
    }
    _selectedPropValMap[event.propertyName] = event.value;
    _selectedOption = _product.findOption(_selectedPropValMap);
    _onSelectedOptionPropMapChanged(emit);
  }

  BaseState? _onGetProductDetailSuccess(ProductDetailDto? result, Emitter<BaseState> emit) {
    if (result != null) {
      _init(result, emit);
    }
    return GetProductDetailSucess(result);
  }

  void _init(ProductDetailDto result, Emitter<BaseState> emit) {
    _product = result;
    _selectableValuesOfPropMap = _product.getAllSelectableValsOfProps();
    _selectedOption = _product.options.firstOrNull;
    if (_selectedOption != null) {
      _selectedPropValMap = _selectedOption!.propertyValuesMap;
      for (MapEntry<String, String> propVal in _selectedPropValMap.entries) {
        _selectableValuesOfPropMap[propVal.key]?.firstWhereOrNull(
          (SelectableValueDto selectable) => selectable.isSelected = true,
        );
      }
    }
    _onSelectedOptionPropMapChanged(emit);
  }

  void _onSelectedOptionPropMapChanged(Emitter<BaseState> emit) {
    emit(
      OptionPropSelectedChanged(selectablePropVals: _selectableValuesOfPropMap, selectedOption: _selectedOption),
    );
  }
}
