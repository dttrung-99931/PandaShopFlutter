// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/shop/data/models/request/warehouse/product_batch_request_model.dart';
import 'package:evievm_app/src/features/shop/data/models/request/warehouse/warehouse_input_request_model.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/product_inventory_model.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/warehouse_input_model.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/warehouse_model.dart';

abstract class WarehouseRepo extends BaseRepo {
  Future<Either<Failure, ProductInventoryModel>> getProductInventory(int productId);
  Future<Either<Failure, List<WarehouseModel>>> getWarehouses();
  Future<Either<Failure, WarehouseInputModel>> createWarehouseInput(WarehouseInputRequestModel param);
  Future<Either<Failure, dynamic>> createProductBatches(List<ProductBatchRequestModel> params);
}
