import 'package:evievm_app/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product_model.dart';

abstract class ProductRepo extends BaseRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts(GetProductsRequestModel params);
}
