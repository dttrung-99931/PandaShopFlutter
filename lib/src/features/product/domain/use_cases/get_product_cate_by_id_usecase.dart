import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/data/models/response/product_category_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_category_dto.dart';
import 'package:evievm_app/src/features/product/domain/repos/product_cate_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProductCateByIdUseCase extends EitherUseCase<ProductCategoryDto, int> {
  final ProductCateRepo _repo;

  GetProductCateByIdUseCase(this._repo);

  @override
  Future<Either<Failure, ProductCategoryDto>> call(int param) async {
    return handleRepoResult(
      repoResult: _repo.getById(param),
      onSuccess: (ProductCategoryModel model) async {
        return ProductCategoryDto.fromModel(model);
      },
    );
  }
}
