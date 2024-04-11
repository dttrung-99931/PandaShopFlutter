import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/shop/data/data_sources/warehouse_data_source.dart';
import 'package:evievm_app/src/features/shop/data/models/request/warehouse/warehouse_input_request_model.dart';
import 'package:evievm_app/src/features/shop/data/models/request/warehouse/product_batch_request_model.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/product_inventory_model.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/warehouse_model.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/warehouse_input_model.dart';
import 'package:evievm_app/src/features/shop/domain/repositories/warehouse_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WarehouseRepo)
class WarehouseRepoImpl extends WarehouseRepo {
  final WarehouseRemoteDatasource datasource;

  WarehouseRepoImpl(this.datasource);

  @override
  Future<Either<Failure, ProductInventoryModel>> getProductInventory(int productId) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getProductInventory(productId: productId),
      ),
    );
  }

  @override
  Future<Either<Failure, dynamic>> createProductBatches(List<ProductBatchRequestModel> params) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.createProductBatches(jsonEncode(params)),
      ),
    );
  }

  @override
  Future<Either<Failure, WarehouseInputModel>> createWarehouseInput(WarehouseInputRequestModel param) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.createWarehouseInput(param),
      ),
    );
  }

  @override
  Future<Either<Failure, List<WarehouseModel>>> getWarehouses() {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getWarehouses(),
      ),
    );
  }
}
