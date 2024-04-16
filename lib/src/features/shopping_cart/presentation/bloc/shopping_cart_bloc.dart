// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/bloc_concurrency.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/shopping_cart/data/models/request/shopping_cart/upsert_cart_request_model.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/base_bloc/base_event.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

ShoppingCartBloc get shoppingCartBloc => getIt<ShoppingCartBloc>();

@lazySingleton
class ShoppingCartBloc extends BaseBloc {
  final GetShoppingCartUseCase _getShoppingCartUseCase;
  final UpsertCartItemUseCase _upsertCartUseCase;
  final DeleteCartItemsUseCase _deleteItems;
  ShoppingCartDto? _cart;
  List<CartItemDto> get selectedItems {
    return (_cart?.items ?? []).where((element) => element.isSelected).toList();
  }

  ShoppingCartBloc(this._getShoppingCartUseCase, this._upsertCartUseCase, this._deleteItems) : super(InitialState()) {
    onLoad<OnGetShoppingCart>(
      _onGetShoppingCart,
      loadingStateBuilder: (_) => LoadingShoppingCart(),
    );
    on<OnUpsertCart>(_onUpsertCart, transformer: BlocConcurrency.sequential());
    on<OnCheckCartItem>(_onCheckCartItem, transformer: BlocConcurrency.sequential());
    on<OnDeleteCartItems>(_onDeleteCartItems, transformer: BlocConcurrency.sequential());
  }

  FutureOr<void> _onGetShoppingCart(OnGetShoppingCart event, Emitter<BaseState> emit) async {
    if (_cart != null && event.clearSelectedItems) {
      emit(ShoppingCartUpdated(_cart!.copyWith(items: [])));
    }
    await handleUsecaseResult(
      usecaseResult: _getShoppingCartUseCase.call(noParam),
      emit: emit,
      onSuccess: (ShoppingCartDto result) {
        _cart = result;
        return GetShoppingCartSuccess(result);
      },
    );
  }

  FutureOr<void> _onUpsertCart(OnUpsertCart event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _upsertCartUseCase.call(event.requestModel),
      emit: emit,
      onSuccess: (dynamic _) {
        CartItemDto? existing = _cart!.items
            .firstWhereOrNull((element) => element.prouductOption.id == event.requestModel.productOptionId)
            ?.copyWith(
              productNum: event.requestModel.productNum,
            );
        if (existing != null) {
          _updateCartItem(existing);
        } else {
          add(OnGetShoppingCart());
        }
        return UpsertShoppingCartSuccess(_cart!, isFirstAdd: false);
      },
    );
  }

  FutureOr<void> _onCheckCartItem(OnCheckCartItem event, Emitter<BaseState> emit) async {
    if (_cart != null) {
      _updateCartItem(event.item..isSelected = event.isChecked);
      emit(ShoppingCartUpdated(_cart!));
    }
  }

  void _updateCartItem(CartItemDto updated) {
    List<CartItemDto> updatedItems = _cart!.items
      ..replaceWhere(
        (item) => item.id == updated.id,
        updated,
      );
    _cart = _cart!.copyWith(items: updatedItems);
  }

  FutureOr<void> _onDeleteCartItems(OnDeleteCartItems event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _deleteItems.call(event.items.mapList((element) => element.id)),
      emit: emit,
      onSuccess: (dynamic _) {
        return DeleteCartItemsSuccess();
      },
    );
  }
}
