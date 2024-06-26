// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/image/base64_image_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/create_product_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/cate_property_template/property_template_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/product_category_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/short_product_model.dart';

import '../../data/models/request/product/search_products_request_model.dart';
import '../../data/models/response/product/product_detail_model.dart';
import '../../data/models/response/product/search_product_model.dart';

abstract class ProductRepo extends BaseRepo {
  Future<Either<Failure, List<ShortProductModel>>> getProducts(GetProductsRequestModel params);
  Future<Either<Failure, SearchProductModel>> searchProducts(SearchProductsRequestModel params);
  Future<Either<Failure, ProductDetailModel?>> getProductDetail(int id);
  Future<Either<Failure, List<ProductCategoryModel>>> getProductCates(GetProductCatesRequestModel params);
  Future<Either<Failure, PropertyTemplateModel>> getPropertyTemplate(int templateId);
  Future<Either<Failure, ShortProductModel>> createProduct(CreateProductRequestModel params);
  Future<Either<Failure, dynamic>> updateProduct(CreateProductRequestModel params);
  Future<Either<Failure, dynamic>> deleteProduct(int productId);

  Future<Either<Failure, dynamic>> createProductImages(ProductImagesParams params);
}

class ProductImagesParams {
  final int productId;
  final List<Base64ImageRequestModel> images;
  ProductImagesParams({
    required this.productId,
    required this.images,
  });
}
