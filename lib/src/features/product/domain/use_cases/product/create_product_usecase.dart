import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/create_product_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/short_product_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/response/product/product_detail_model.dart';
import '../../repos/product_repo.dart';

@lazySingleton
class CreateProductUseCase extends EitherUseCase<ProductDto, CreateProductRequestModel> {
  final ProductRepo _repo;

  CreateProductUseCase(this._repo);

  @override
  Future<Either<Failure, ProductDto>> call(CreateProductRequestModel params) async {
    return handleRepoResult(
      repoResult: _repo.createProduct(params),
      onSuccess: (ShortProductModel model) async {
        return ProductDto.fromModel(model);
      },
    );
  }
}
