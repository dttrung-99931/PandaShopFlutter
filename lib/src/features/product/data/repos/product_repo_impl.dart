import 'dart:convert';

import 'package:evievm_app/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/create_product_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/search_products_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/cate_property_template/property_template_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/product_category_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/short_product_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/search_product_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/product_repo.dart';
import '../data_sources/product_remote_data_soruce.dart';
import '../models/response/product/product_detail_model.dart';

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

  @override
  Future<Either<Failure, ShortProductModel>> createProduct(CreateProductRequestModel params) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.createProduct(params),
      ),
    );
  }

  @override
  Future<Either<Failure, dynamic>> createProductImages(ProductImagesParams params) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.createProductImages(
          productId: params.productId,
          body: jsonEncode(params.images.mapList((element) => element.toJson())),
        ),
      ),
    );
  }

  @override
  Future<Either<Failure, dynamic>> updateProduct(CreateProductRequestModel params) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.updateProduct(params.id!, params),
      ),
    );
  }

  @override
  Future<Either<Failure, dynamic>> deleteProduct(int productId) async {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.deleteProduct(productId),
      ),
    );
  }
}
