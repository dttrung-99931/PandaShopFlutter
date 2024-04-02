// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/cate_property_template/property_template_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product_category_model.dart';

abstract class ProductCateRepo extends BaseRepo {
  Future<Either<Failure, List<ProductCategoryModel>>> getProductCates(GetProductCatesRequestModel params);
  Future<Either<Failure, ProductCategoryModel>> getById(int id);
  Future<Either<Failure, PropertyTemplateModel>> getPropertyTemplate(int templateId);
}
