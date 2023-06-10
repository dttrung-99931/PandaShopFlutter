import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/data/models/response/search_product_model.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/request/search_products_request_model.dart';
import '../dto/search_product_dto.dart';
import '../repos/product_repo.dart';

@lazySingleton
class SearchProductsUserCase extends EitherUseCase<SearchProductDto, SearchProductsRequestModel> {
  final ProductRepo _repo;

  SearchProductsUserCase(this._repo);

  @override
  Future<Either<Failure, SearchProductDto>> call(SearchProductsRequestModel param) async {
    return handleRepoResult(
      repoResult: _repo.searchProducts(param),
      onSuccess: (SearchProductModel model) async {
        return SearchProductDto.fromModel(model);
      },
    );
  }
}
