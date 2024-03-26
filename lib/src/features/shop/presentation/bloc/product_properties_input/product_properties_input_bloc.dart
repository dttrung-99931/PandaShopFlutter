// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_template_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_category_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/get_product_cates_usecase.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_properties_input/product_properties_input_communicaton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';

part 'product_properties_input_event.dart';
part 'product_properties_input_state.dart';

ProductPropertiesInputBloc get productPropsInputBloc => getIt();

@lazySingleton
class ProductPropertiesInputBloc extends BaseBloc with AddressBlocMixin {
  ProductPropertiesInputBloc(this._getPropertyTemp) : super(InitialState()) {
    on<OnGetPropertyTemplateOfCate>(_onGetPropertyTemplateOfCate);
  }

  @override
  BlocCommunication? get blocCommunication => getIt<ProductPropertiesInputCommunication>();

  final GetPropertyTemplateOfCateUseCase _getPropertyTemp;
  // Map<property id, text edt controller>
  final Map<int, TextEditingController> _textControllerMap = {};

  FutureOr<void> _onGetPropertyTemplateOfCate(OnGetPropertyTemplateOfCate event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getPropertyTemp.call(event.cateId),
      emit: emit,
      onSuccess: (PropertyTemplateDto result) {
        _textControllerMap.clear();
        for (PropertyValuesDto element in result.properties) {
          _textControllerMap[element.id] = TextEditingController();
        }
        return GetPropTemplateSuccess(result, textControllerMap: _textControllerMap);
      },
    );
  }
}
