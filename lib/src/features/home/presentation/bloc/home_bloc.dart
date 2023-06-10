// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/get_products_usecase.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';

import '../../../product/domain/dto/product_dto.dart';

part 'home_event.dart';
part 'home_state.dart';

@lazySingleton
class HomeBloc extends BaseBloc {
  final GetProductsUserCase _getProductsUserCase;

  HomeBloc(this._getProductsUserCase) : super(InitialState()) {
    onLoad<OnGetHomeProducts>(_onGetHomeProducts);
  }

  Future<void> _onGetHomeProducts(OnGetHomeProducts event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getProductsUserCase.call(GetProductsRequestModel()),
      emit: emit,
      onSuccess: (List<ProductDto> result) {
        return GetProductsSucess(result);
      },
    );
  }
}
