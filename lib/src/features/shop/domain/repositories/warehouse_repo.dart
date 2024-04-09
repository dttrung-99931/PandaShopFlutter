// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/shop/data/models/response/product_inventory/product_inventory_model.dart';

abstract class WarehouseRepo extends BaseRepo {
  Future<Either<Failure, ProductInventoryModel>> getProductInventory(int productId);
}
