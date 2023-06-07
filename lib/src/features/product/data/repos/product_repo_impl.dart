import 'package:evievm_app/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:evievm_app/src/features/product/data/models/response/product_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_products_request_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/product_repo.dart';
import '../data_sources/product_remote_data_soruce.dart';

@LazySingleton(as: ProductRepo)
class ProductRepoImpl extends ProductRepo {
  final ProductRemoteDatasource datasource;

  ProductRepoImpl(this.datasource);

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts(GetProductsRequestModel params) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getProducts(params),
      ),
    );
  }
}
