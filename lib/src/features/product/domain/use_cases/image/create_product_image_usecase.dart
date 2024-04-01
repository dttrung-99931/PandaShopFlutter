import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/domain/repos/product_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateProductImagesUseCase extends EitherUseCase<dynamic, ProductImagesParams> {
  final ProductRepo _repo;

  CreateProductImagesUseCase(this._repo);

  @override
  Future<Either<Failure, dynamic>> call(ProductImagesParams params) async {
    return handleRepoResult(
      repoResult: _repo.createProductImages(params),
      onSuccess: (dynamic model) async {},
    );
  }
}
