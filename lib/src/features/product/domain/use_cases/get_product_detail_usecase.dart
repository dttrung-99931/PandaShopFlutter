import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/response/product_detail_model.dart';
import '../repos/product_repo.dart';

@lazySingleton
class GetProductDetailUseCase extends EitherUseCase<ProductDetailDto?, int> {
  final ProductRepo _repo;

  GetProductDetailUseCase(this._repo);

  @override
  Future<Either<Failure, ProductDetailDto?>> call(int id) async {
    return handleRepoResult(
      repoResult: _repo.getProductDetail(id),
      onSuccess: (ProductDetailModel? model) async {
        return model != null ? ProductDetailDto.fromModel(model) : null;
      },
    );
  }
}
