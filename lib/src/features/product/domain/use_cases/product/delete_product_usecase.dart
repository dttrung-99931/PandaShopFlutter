// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/domain/repos/product_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteProductUseCase extends EitherUseCase<dynamic, int> {
  final ProductRepo _repo;

  DeleteProductUseCase(this._repo);

  @override
  Future<Either<Failure, dynamic>> call(int productId) async {
    return handleRepoResult(
      repoResult: _repo.deleteProduct(productId),
      onSuccess: (dynamic model) async {},
    );
  }
}
