// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_template_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_properties_input/product_properties_input_communicaton.dart';
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
    on<OnFillInPropertyValues>(_onFillInPropertyValues);
  }

  @override
  BlocCommunication? get blocCommunication => getIt<ProductPropertiesInputCommunication>();

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
      emit: emit,
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
          (PropertyValuesDto prop) => prop.id == event.optionPropUpdated.prop.id,
        );
        _textControllerMap.removeWhere(
          (key, value) => key == event.optionPropUpdated.prop.id,
        );
        break;
      case EditAction.delete:
        _productProperties.add(event.optionPropUpdated.prop);
        _textControllerMap[event.optionPropUpdated.prop.id] = TextEditingController();
        break;
      default:
    }
    emit(productPropsUpdated);
  }

  FutureOr<void> _onFillInPropertyValues(OnFillInPropertyValues event, Emitter<BaseState> emit) {
    for (PropertyValueDto element in event.propValues) {
      _textControllerMap[element.propertyId]?.text = element.value;
    }
  }
}
