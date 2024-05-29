// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_template_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart';
import 'package:evievm_app/src/shared/enums/edit_action.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'product_properties_input_event.dart';
part 'product_properties_input_state.dart';

ProductPropertiesInputBloc get productPropsInputBloc => getIt();

@lazySingleton
class ProductPropertiesInputBloc extends BaseBloc with AddressBlocMixin {
  ProductPropertiesInputBloc(this._getPropertyTemp) : super(InitialState()) {
    on<OnGetPropertyTemplateOfCate>(_onGetPropertyTemplateOfCate);
    on<OnOptionPropsUpdated>(_onOptionPropsUpdated);
    on<OnInitPropertyValues>(_onInitPropertyValues);
  }

  final GetPropertyTemplateOfCateUseCase _getPropertyTemp;
  // Map<property id, text edt controller>
  final Map<int, TextEditingController> _textControllerMap = {};
  Map<int, TextEditingController> get textControllerMap => Map.unmodifiable(_textControllerMap);

  List<PropertyValuesDto> _productProperties = [];
  List<PropertyValuesDto> get productProperties => List.unmodifiable(_productProperties);

  ProductPropsUpdated get productPropsUpdated => ProductPropsUpdated(
        [..._productProperties],
        textControllerMap: {..._textControllerMap},
      );

  FutureOr<void> _onGetPropertyTemplateOfCate(OnGetPropertyTemplateOfCate event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getPropertyTemp.call(event.cateId),
      emit: emit.call,
      onSuccess: (PropertyTemplateDto result) {
        _textControllerMap.clear();
        for (PropertyValuesDto element in result.properties) {
          _textControllerMap[element.propertyId] = TextEditingController();
        }
        _productProperties = result.properties;
        return productPropsUpdated;
      },
    );
  }

  FutureOr<void> _onOptionPropsUpdated(OnOptionPropsUpdated event, Emitter<BaseState> emit) {
    switch (event.optionPropUpdated.propAction) {
      case EditAction.add:
        _productProperties.removeWhere(
          (PropertyValuesDto prop) => event.optionPropUpdated.propList
              .any((PropertyValuesDto element) => prop.propertyId == element.propertyId),
        );
        _textControllerMap.removeWhere(
          (propId, _) => event.optionPropUpdated.propList.any(
            (PropertyValuesDto element) => propId == element.propertyId,
          ),
        );
        break;
      case EditAction.delete:
        _productProperties.addAll(event.optionPropUpdated.propList);
        _textControllerMap.addAll(
          Map.fromEntries(event.optionPropUpdated.propList
              .mapList((element) => MapEntry(element.propertyId, TextEditingController()))),
        );
        break;
      default:
    }
    emit(productPropsUpdated);
  }

  FutureOr<void> _onInitPropertyValues(OnInitPropertyValues event, Emitter<BaseState> emit) {
    _textControllerMap.clear();
    for (PropertyValueDto element in event.propValues) {
      _textControllerMap[element.propertyId] = TextEditingController(text: element.value);
    }
    _productProperties.assignAll(event.propValues.mapList((element) => element.toPropertyValues()));
    emit(productPropsUpdated);
  }
}
