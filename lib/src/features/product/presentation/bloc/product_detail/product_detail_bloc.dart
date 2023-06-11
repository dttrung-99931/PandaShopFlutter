// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/utils/bloc_concurrency.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/search_products_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/search_product_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/get_products_usecase.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/search_products_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';

import '../../../../../../core/base_bloc/base_event.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';
import '../../../domain/dto/product_dto.dart';
import '../../../domain/use_cases/get_product_detail_usecase.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

@lazySingleton
class ProductDetailBloc extends BaseBloc {
  final GetProductDetailUseCase _getProductDetailUsecase;

  ProductDetailBloc(this._getProductDetailUsecase) : super(InitialState()) {
    onLoad<OnGetProductDetail>(
      _onGetProductDetail,
      loadingStateBuilder: (_) => LoadingProducts(),
    );
  }

  Future<void> _onGetProductDetail(OnGetProductDetail event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getProductDetailUsecase.call(event.id),
      emit: emit,
      onSuccess: (ProductDetailDto? result) {
        return GetProductDetailSucess(result);
      },
    );
  }
}
