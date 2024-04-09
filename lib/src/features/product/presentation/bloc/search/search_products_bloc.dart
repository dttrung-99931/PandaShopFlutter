// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/utils/bloc_concurrency.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/search_products_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_category_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/search_product_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_products_usecase.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/product/search_products_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';

import '../../../../home/presentation/bloc/home_bloc.dart';
import '../../../domain/dto/product/product_dto.dart';

part 'search_products_event.dart';
part 'search_products_state.dart';

@lazySingleton
class SearchProductsBloc extends BaseBloc {
  final SearchProductsUserCase _searchUsecase;
  final GetProductsUseCase _getUsecase;

  final TextEditingController _edtController = TextEditingController();
  TextEditingController get edtController => _edtController;

  @override
  void onInitialEvent() {
    _edtController.text = '';
  }

  SearchProductsBloc(this._searchUsecase, this._getUsecase) : super(InitialState()) {
    on<OnSearchProducts>(
      _onSearchProducts,
      transformer: BlocConcurrency.debounce(300.milliseconds),
    );
    onLoad<OnGetProducts>(
      _onGetProducts,
      transformer: BlocConcurrency.debounce(300.milliseconds),
      loadingStateBuilder: (_) => LoadingProducts(),
    );
  }

  Future<void> _onSearchProducts(OnSearchProducts event, Emitter<BaseState> emit) async {
    if (isNullOrEmpty(event.q)) {
      emit(
        SearchProductsSucess(
          SearchProductDto(categories: [], products: []),
          isSearchHistory: true,
        ),
      );
      return;
    }

    await handleUsecaseResult(
      usecaseResult: _searchUsecase.call(SearchProductsRequestModel(q: event.q)),
      emit: emit,
      onSuccess: (SearchProductDto result) {
        return SearchProductsSucess(result, isSearchHistory: false);
      },
    );
  }

  Future<void> _onGetProducts(OnGetProducts event, Emitter<BaseState> emit) async {
    _edtController.text = event.q ?? event.category?.name ?? '';
    await handleUsecaseResult(
      usecaseResult: _getUsecase.call(
        GetProductsRequestModel(
          categoryIdLV1: event.category?.categoryIdLV1,
          categoryIdLV2: event.category?.categoryIdLV2,
          categoryIdLV3: event.category?.categoryIdLV3,
          q: event.q,
        ),
      ),
      emit: emit,
      onSuccess: (List<ProductDto> result) {
        return GetProductsSucess(result);
      },
    );
  }
}
