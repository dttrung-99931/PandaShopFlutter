// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/product_inventory/product_batch_input_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/product_inventory/product_inventory_input_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_inventory_input_event.dart';
part 'product_inventory_input_state.dart';

ProductInventoryInputBloc get productInventoryInpBloc => getIt();

@lazySingleton
class ProductInventoryInputBloc extends BaseBloc {
  ProductInventoryInputBloc() : super(InitialState()) {
    onLoad<OnAddInventoryInput>(_onAddInventoryInput);
  }
  final List<ProductInventoryInputDto> _inputs = [];

  FutureOr<void> _onAddInventoryInput(OnAddInventoryInput event, Emitter<BaseState> emit) async {
    // TODO
    _inputs.add(ProductInventoryInputDto(productBatches: [], productId: -1));
    ProductInventoryInputsUpdated([..._inputs]);
  }
}
