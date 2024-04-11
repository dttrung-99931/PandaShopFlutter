// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/shop/data/models/request/warehouse/product_batch_request_model.dart';
import 'package:evievm_app/src/features/shop/domain/repositories/warehouse_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateProductBatchesUseCase extends EitherUseCase<dynamic, List<ProductBatchRequestModel>> {
  final WarehouseRepo _repo;

  CreateProductBatchesUseCase(this._repo);

  @override
  Future<Either<Failure, dynamic>> call(List<ProductBatchRequestModel> params) async {
    return handleRepoResult(
      repoResult: _repo.createProductBatches(params),
      onSuccess: (dynamic model) async {},
    );
  }
}
