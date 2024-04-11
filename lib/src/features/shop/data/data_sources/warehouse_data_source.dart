import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/shop/data/models/request/warehouse/product_batch_request_model.dart';
import 'package:evievm_app/src/features/shop/data/models/request/warehouse/warehouse_input_request_model.dart';
import 'package:evievm_app/src/features/shop/data/models/request/warehouse/warehouse_request_model.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/product_inventory_model.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/warehouse_input_model.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/warehouse_model.dart';
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

  @GET('/v1/Warehouse')
  Future<BaseResponse<List<WarehouseModel>>> getWarehouses();

  @POST('/v1/Warehouse')
  Future<BaseResponse<WarehouseModel>> createWarehouse(@Body() WarehouseRequestModel param);

  @POST('/v1/WarehouseInput')
  Future<BaseResponse<WarehouseInputModel>> createWarehouseInput(@Body() WarehouseInputRequestModel param);

  /// [productBatches] is value of jsonEncode(List<ProductBatchRequestModel>)
  @POST('/v1/ProductBatch/Many')
  Future<BaseResponse<dynamic>> createProductBatches(@Body() String productBatches);
}
