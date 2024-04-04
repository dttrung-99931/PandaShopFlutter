import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/shop/data/models/request/shop_request_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'shop_remote_data_soruce.g.dart';

@module
abstract class ShopRepoteDatasourceProvider {
  @singleton
  ShopRemoteDatasource provideShopRepoteDatasource(Dio dio) {
    return _ShopRemoteDatasource(dio);
  }
}

@RestApi()
abstract class ShopRemoteDatasource {
  @POST('/v1/Users/{userId}/Shop')
  Future<BaseResponse> resgisterShop({
    @Path() required int userId,
    @Body() required ShopRequestModel params,
  });
}
