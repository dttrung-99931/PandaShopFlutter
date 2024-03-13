// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/features/product/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/shopping_cart/get_shopping_cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/base_bloc/base_event.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

@lazySingleton
class ShoppingCartBloc extends BaseBloc {
  final GetShoppingCartUseCase _getShoppingCartUseCase;

  ShoppingCartBloc(this._getShoppingCartUseCase) : super(InitialState()) {
    onLoad<OnGetShoppingCart>(
      _onGetShoppingCart,
      loadingStateBuilder: (_) => LoadingProductDetail(),
    );
  }

  Future<void> _onGetShoppingCart(OnGetShoppingCart event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getShoppingCartUseCase.call(event.id),
      emit: emit,
      onSuccess: (ShoppingCartDto result) {
        return GetShoppingCartSuccess(result);
      },
    );
  }
}
