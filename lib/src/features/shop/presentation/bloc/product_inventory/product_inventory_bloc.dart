// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/dtos/product_inventory/product_inventory_dto.dart';

part 'product_inventory_event.dart';
part 'product_inventory_state.dart';

ProductInventoryBloc get productInventoryBloc => getIt();

@lazySingleton
class ProductInventoryBloc extends BaseBloc {
  final GetProductInventoryUseCase _getProductInventory;

  ProductInventoryBloc(
    this._getProductInventory,
  ) : super(InitialState()) {
    onLoad<OnGetProductInventory>(_onGetProductInventory);
  }

  FutureOr<void> _onGetProductInventory(OnGetProductInventory event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getProductInventory.call(event.productId),
      emit: emit,
      onSuccess: (ProductInventoryDto result) {
        return GetProductInventorySuccess(result);
      },
    );
  }
}
