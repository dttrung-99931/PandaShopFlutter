import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/create_product_request_model.dart';
import 'package:injectable/injectable.dart';

import '../repos/product_repo.dart';

@lazySingleton
class UpdateProductUseCase extends EitherUseCase<dynamic, CreateProductRequestModel> {
  final ProductRepo _repo;

  UpdateProductUseCase(this._repo);

  @override
  Future<Either<Failure, dynamic>> call(CreateProductRequestModel params) async {
    return handleRepoResult(
      repoResult: _repo.updateProduct(params),
      onSuccess: (dynamic model) async {
        return model;
      },
    );
  }
}
