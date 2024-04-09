import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/image/base64_image_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/create_product_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/cate_property_template/property_template_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/product_category_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/short_product_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/request/product/search_products_request_model.dart';
import '../models/response/product/product_detail_model.dart';
import '../models/response/product/search_product_model.dart';

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
  Future<BaseResponse<List<ShortProductModel>>> getProducts(@Queries() GetProductsRequestModel params);

  @GET('/v1/Products/SearchSuggestions')
  Future<BaseResponse<SearchProductModel>> searchProducts(@Queries() SearchProductsRequestModel params);

  @GET('/v1/Products/{id}')
  Future<BaseResponse<ProductDetailModel?>> getProductDetail(@Path() int id);

  @GET('/v1/Categories')
  Future<BaseResponse<List<ProductCategoryModel>>> getProductCates(@Queries() GetProductCatesRequestModel params);

  @GET('/v1/Categories/{cateId}/Template')
  Future<BaseResponse<PropertyTemplateModel>> getPropertyTemplate(@Path() int cateId);

  @POST('/v1/Products')
  Future<BaseResponse<ShortProductModel>> createProduct(@Body() CreateProductRequestModel params);

  @PUT('/v1/Products/{id}')
  Future<BaseResponse> updateProduct(@Path() int id, @Body() CreateProductRequestModel params);

  @DELETE('/v1/Products/{id}')
  @NoBody()
  Future<BaseResponse> deleteProduct(@Path() int id);

  @POST('/v1/Products/{productId}/Images')
  Future<BaseResponse<dynamic>> createProductImages({
    @Path() required productId,
    @Body() required String body,
  });
}
