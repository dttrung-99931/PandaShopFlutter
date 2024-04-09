import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/product_category_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_category_dto.dart';
import 'package:injectable/injectable.dart';

import '../../repos/product_repo.dart';

@lazySingleton
class GetProductCatesUseCase extends EitherUseCase<List<ProductCategoryDto>, GetProductCatesRequestModel> {
  final ProductRepo _repo;

  GetProductCatesUseCase(this._repo);

  @override
  Future<Either<Failure, List<ProductCategoryDto>>> call(GetProductCatesRequestModel param) async {
    return handleRepoResult(
      repoResult: _repo.getProductCates(param),
      onSuccess: (List<ProductCategoryModel> model) async {
        return model.map((e) => ProductCategoryDto.fromModel(e)).toList();
      },
    );
  }
}
