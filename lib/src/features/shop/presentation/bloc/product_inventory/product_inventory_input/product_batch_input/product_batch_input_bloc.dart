// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/product_inventory/product_batch_input_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_batch_input_event.dart';
part 'product_batch_input_state.dart';

ProductBatchInputBloc get productBatchInpBloc => getIt();

@lazySingleton
class ProductBatchInputBloc extends BaseBloc {
  ProductBatchInputBloc() : super(InitialState()) {
    on<OnAddProductBatchInput>(_onAddInventoryInput);
  }
  final List<ProductBatchInputDto> _productBatches = [];

  FutureOr<void> _onAddInventoryInput(OnAddProductBatchInput event, Emitter<BaseState> emit) async {
    ProductBatchInputDto added = ProductBatchInputDto(productInventoryInputId: event.productInventoryId);
    _productBatches.add(added);
    ProductBatchAdded(added);
  }
}
