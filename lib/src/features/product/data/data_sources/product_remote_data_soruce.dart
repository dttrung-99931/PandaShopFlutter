import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/request/search_products_request_model.dart';
import '../models/response/search_product_model.dart';

part 'product_remote_data_soruce.g.dart';

@module
abstract class ProductRemoteDatasourceProvider {
  @singleton
  ProductRemoteDatasource provideProductRemoteDatasource(Dio dio) {
    return _ProductRemoteDatasource(dio);
  }
}

@RestApi()
abstract class ProductRemoteDatasource {
  @GET('/v1/Products')
  Future<BaseResponse<List<ProductModel>>> getProducts(@Queries() GetProductsRequestModel params);

  @GET('/v1/Products/SearchSuggestions')
  Future<BaseResponse<SearchProductModel>> searchProducts(@Queries() SearchProductsRequestModel params);
}
