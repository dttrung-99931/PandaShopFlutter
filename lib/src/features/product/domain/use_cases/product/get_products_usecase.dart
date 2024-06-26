import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/response/product/short_product_model.dart';
import '../../repos/product_repo.dart';

@lazySingleton
class GetProductsUseCase extends EitherUseCase<List<ProductDto>, GetProductsRequestModel> {
  final ProductRepo _repo;

  GetProductsUseCase(this._repo);

  @override
  Future<Either<Failure, List<ProductDto>>> call(GetProductsRequestModel param) async {
    return handleRepoResult(
      repoResult: _repo.getProducts(param),
      onSuccess: (List<ShortProductModel> model) async {
        return model.map((e) => ProductDto.fromModel(e)).toList();
      },
    );
  }
}
