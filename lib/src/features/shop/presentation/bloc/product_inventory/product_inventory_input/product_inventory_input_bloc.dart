// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_products_usecase.dart';
import 'package:evievm_app/src/features/shop/data/models/request/warehouse/product_batch_request_model.dart';
import 'package:evievm_app/src/features/shop/data/models/request/warehouse/warehouse_input_request_model.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/product_batch_input_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/product_inventory_inp_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/warehouse_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/warehouse_input_dto.dart';
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart';
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart';
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_inventory_input_event.dart';
part 'product_inventory_input_state.dart';

ProductInventoryInputBloc get productInventoryInpBloc => getIt();

@lazySingleton
class ProductInventoryInputBloc extends BaseBloc {
  ProductInventoryInputBloc(
    this._getProducts,
    this._createWarehouseInput,
    this._createProductBatches,
    this._getWarehouses,
  ) : super(InitialState()) {
    on<OnAddInventoryInput>(_onAddInventoryInput);
    on<OnGetProdsToSelect>(_onGetProdsToSelect);
    on<OnProductBatchAdded>(_onProductBatchAdded);
    on<OnProdSelected>(_onProdSelected);
    onLoad<OnCreateProductInventory>(
      _onCreateProductInventory,
      loadingBuilder: (_) => LoadingState<OnCreateProductInventory>(),
    );
    on<OnGetWarehousesToSelect>(_onGetWarehousesToSelect);
    on<OnWarehouseSelected>(_onWarehouseSelected);
  }
  @override
  BlocCommunication<BaseBloc>? get blocCommunication => getIt<ProductInventoryInputCommunication>();

  final GetProductsUseCase _getProducts;
  final CreateWarehouseInputUseCase _createWarehouseInput;
  final CreateProductBatchesUseCase _createProductBatches;
  final GetWarehousesUseCase _getWarehouses;
  final List<ProductInventoryInpDto> _prodInpInputs = [];
  List<ProductDto>? _cacheShopProducts;
  WarehouseDto? _selectedWarehouse;

  FutureOr<void> _onAddInventoryInput(OnAddInventoryInput event, Emitter<BaseState> emit) async {
    // TODO
    _prodInpInputs.add(ProductInventoryInpDto(productBatches: [], productId: null));
    emit(ProductInventoryInpsUpdated([..._prodInpInputs]));
  }

  FutureOr<void> _onGetProdsToSelect(OnGetProdsToSelect event, Emitter<BaseState> emit) async {
    if (_cacheShopProducts != null) {
      emit(GetProdsToSelectSucess(
        _cacheShopProducts!,
        selectedId: null,
        productInventoryInpId: event.productInventoryInpId,
      ));
      return;
    }
    await handleUsecaseResult(
      usecaseResult: _getProducts.call(GetProductsRequestModel.shopProducts()),
      emit: emit,
      onSuccess: (List<ProductDto> result) {
        return GetProdsToSelectSucess(
          _cacheShopProducts = result,
          selectedId: null,
          productInventoryInpId: event.productInventoryInpId,
        );
      },
    );
  }

  FutureOr<void> _onProductBatchAdded(OnProductBatchAdded event, Emitter<BaseState> emit) {
    _getInventoryInput(event.productBatch.productInventoryInputId).productBatches.add(event.productBatch);
    emit(ProductInventoryInpsUpdated([..._prodInpInputs]));
  }

  void _updateInventoryInput(int productInventoryId, {required Function(ProductInventoryInpDto inventoryInp) updater}) {
    ProductInventoryInpDto inventoryInp = _prodInpInputs.firstWhere((element) => element.id == productInventoryId);
    updater(inventoryInp);
  }

  ProductInventoryInpDto _getInventoryInput(int productInventoryId) {
    return _prodInpInputs.firstWhere((element) => element.id == productInventoryId);
  }

  FutureOr<void> _onProdSelected(OnProdSelected event, Emitter<BaseState> emit) {
    emit(GetProdsToSelectSucess(
      _cacheShopProducts!,
      selectedId: event.selectedProduct.id,
      productInventoryInpId: event.productInventoryInpId,
    ));
    _updateInventoryInput(
      event.productInventoryInpId,
      updater: (inventoryInp) {
        inventoryInp.productId = event.selectedProduct.id;
      },
    );
    // emit(ProductInventoryInpsUpdated([..._inputs]));
  }

  @override
  bool validateMoreData() {
    return _selectedWarehouse != null && _selectedWarehouse?.id != Constatnts.idEmpty;
  }

  FutureOr<void> _onCreateProductInventory(OnCreateProductInventory event, Emitter<BaseState> emit) async {
    WarehouseInputDto? createdInput = await handleUsecaseResult(
      usecaseResult: _createWarehouseInput.call(WarehouseInputRequestModel(
        id: null,
        warehouseId: _selectedWarehouse!.id!,
        date: now,
      )),
      emit: emit,
      onSuccess: (WarehouseInputDto result) {
        return CreateWarehouseInputSuccess(result);
      },
    );

    if (createdInput != null) {
      List<ProductBatchInputDto> batchInputs =
          _prodInpInputs.mapList((element) => element.productBatches).merge().toList();
      List<ProductBatchRequestModel> batchInputRequests = batchInputs.mapList(
        (element) => element.toRequestModel(warehouseInputId: createdInput.id!),
      );
      await handleUsecaseResult(
        usecaseResult: _createProductBatches.call(batchInputRequests),
        emit: emit,
        onSuccess: (dynamic result) {
          return CreateProductInventorySuccess();
        },
        onError: (failure) {
          return CreateProductInventoryError(failure);
        },
      );
    } else {
      logd('Create warehouse input error on date: $now');
    }
  }

  FutureOr<void> _onGetWarehousesToSelect(OnGetWarehousesToSelect event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getWarehouses.call(noParam),
      emit: emit,
      onSuccess: (List<WarehouseDto> result) {
        return GetWarehousesSuccess(
          result,
          selectedId: event.selectedId,
        );
      },
      onError: (failure) {
        return CreateProductInventoryError(failure);
      },
    );
  }

  FutureOr<void> _onWarehouseSelected(OnWarehouseSelected event, Emitter<BaseState> emit) {
    _selectedWarehouse = event.selected;
  }

  @disposeMethod
  @override
  Future<void> close() {
    return super.close();
  }
}
