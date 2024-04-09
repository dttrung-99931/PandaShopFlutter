import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/shop/data/models/response/product_inventory/product_inventory_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'warehouse_data_source.g.dart';

@module
abstract class WarehouseRemoteDatasourceProvider {
  @singleton
  WarehouseRemoteDatasource provideWarehouseRemoteDatasource(Dio dio) {
    return _WarehouseRemoteDatasource(dio);
  }
}

@RestApi()
abstract class WarehouseRemoteDatasource {
  @GET('/v1/ProductInventory/{productId}')
  Future<BaseResponse<ProductInventoryModel>> getProductInventory({
    @Path() required int productId,
  });
}
