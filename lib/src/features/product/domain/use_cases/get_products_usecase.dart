import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_dto.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/response/product_model.dart';
import '../repos/product_repo.dart';

@lazySingleton
class GetProductsUserCase extends EitherUseCase<List<ProductDto>, GetProductsRequestModel> {
  final ProductRepo _repo;

  GetProductsUserCase(this._repo);

  @override
  Future<Either<Failure, List<ProductDto>>> call(GetProductsRequestModel param) async {
    return handleRepoResult(
      repoResult: _repo.getProducts(param),
      onSuccess: (List<ProductModel> model) async {
        return model.map((e) => ProductDto.fromModel(e)).toList();
      },
    );
  }
}
