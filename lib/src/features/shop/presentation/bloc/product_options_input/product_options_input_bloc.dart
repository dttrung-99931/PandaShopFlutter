// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_option_input_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_communicaton.dart';
import 'package:evievm_app/src/shared/enums/edit_action.dart';
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
  }
  @override
  BlocCommunication? get blocCommunication => getIt<ProductOptionsInputCommunication>();

  final List<PropertyValuesDto> _optionProperties = [];
  List<PropertyValuesDto> get optionProperties => List.unmodifiable(_optionProperties);

  final List<ProductOptionInputDto> _productOptionInputs = [];

  FutureOr<void> _onAddPropertyForOption(OnAddPropertyForOption event, Emitter<BaseState> emit) async {
    _optionProperties.add(event.prop);
    emit(OptionPropsUpdated(
      _optionProperties,
      prop: event.prop,
      propAction: EditAction.add,
    ));
  }

  FutureOr<void> _onRemovePropertyForOption(OnRemovePropertyForOption event, Emitter<BaseState> emit) async {
    _optionProperties.removeWhere((element) => event.prop.id == element.id);
    emit(OptionPropsUpdated(
      _optionProperties,
      prop: event.prop,
      propAction: EditAction.delete,
    ));
  }

  FutureOr<void> _onAddProductOption(OnAddProductOption event, Emitter<BaseState> emit) {
    _productOptionInputs.add(
      ProductOptionInputDto.fromProps(_optionProperties),
    );
    emit(ProductOptionsUpdated(_productOptionInputs));
  }
}