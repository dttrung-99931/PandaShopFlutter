import 'package:evievm_app/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/search_products_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/cate_property_template/property_template_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product_category_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/short_product_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/search_product_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/product_repo.dart';
import '../data_sources/product_remote_data_soruce.dart';
import '../models/response/product_detail_model.dart';

@LazySingleton(as: ProductRepo)
class ProductRepoImpl extends ProductRepo {
  final ProductRemoteDatasource datasource;

  ProductRepoImpl(this.datasource);

  @override
  Future<Either<Failure, List<ShortProductModel>>> getProducts(GetProductsRequestModel params) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getProducts(params),
      ),
    );
  }

  @override
  Future<Either<Failure, SearchProductModel>> searchProducts(SearchProductsRequestModel params) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.searchProducts(params),
      ),
    );
  }

  @override
  Future<Either<Failure, ProductDetailModel?>> getProductDetail(int id) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getProductDetail(id),
      ),
    );
  }

  @override
  Future<Either<Failure, List<ProductCategoryModel>>> getProductCates(GetProductCatesRequestModel params) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getProductCates(params),
      ),
    );
  }

  @override
  Future<Either<Failure, PropertyTemplateModel>> getPropertyTemplate(int templateId) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getPropertyTemplate(templateId),
      ),
    );
  }
}
