import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/product/data/models/request/shopping_cart/upsert_cart_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/shopping_cart/shopping_cart_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'shopping_cart_data_soruce.g.dart';

@module
abstract class ShoppingCartDatasourceProvider {
  @singleton
  ShoppingCartDatasource provideShoppingCartDatasource(Dio dio) {
    return _ShoppingCartDatasource(dio);
  }
}

@RestApi()
abstract class ShoppingCartDatasource {
  @GET('/v1/carts/{shoppingCartId}')
  Future<BaseResponse<ShoppingCartModel>> get(@Path('shoppingCartId') int shoppingCartId);

  @PUT('/v1/carts/UpsertCart')
  Future<BaseResponse<dynamic>> upsert(@Body() UpsertCartRequestModel param);

  @DELETE('/v1/carts/DeleteMany')
  Future<BaseResponse<dynamic>> deleteItems(@Body() Map<String, dynamic> param);
}
