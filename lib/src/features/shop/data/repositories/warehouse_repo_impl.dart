import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/shop/data/data_sources/warehouse_data_source.dart';
import 'package:evievm_app/src/features/shop/data/models/response/product_inventory/product_inventory_model.dart';
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
}
