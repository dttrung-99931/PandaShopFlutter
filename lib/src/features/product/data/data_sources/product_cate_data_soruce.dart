import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/cate_property_template/property_template_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/product_category_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'product_cate_data_soruce.g.dart';

@module
abstract class ProductCateDatasourceProvider {
  @singleton
  ProductCateDatasource provideProductCateDatasource(Dio dio) {
    return _ProductCateDatasource(dio);
  }
}

@RestApi()
abstract class ProductCateDatasource {
  @GET('/v1/Categories')
  Future<BaseResponse<List<ProductCategoryModel>>> getProductCates(@Queries() GetProductCatesRequestModel params);

  @GET('/v1/Categories/{id}')
  Future<BaseResponse<ProductCategoryModel>> getById(@Path() int id);

  @GET('/v1/Categories/{cateId}/Template')
  Future<BaseResponse<PropertyTemplateModel>> getPropertyTemplate(@Path() int cateId);
}
