// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/shop/data/models/request/warehouse/warehouse_input_request_model.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/warehouse_input_model.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/warehouse_input_dto.dart';
import 'package:evievm_app/src/features/shop/domain/repositories/warehouse_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateWarehouseInputUseCase extends EitherUseCase<WarehouseInputDto, WarehouseInputRequestModel> {
  final WarehouseRepo _repo;

  CreateWarehouseInputUseCase(this._repo);

  @override
  Future<Either<Failure, WarehouseInputDto>> call(WarehouseInputRequestModel params) async {
    return handleRepoResult(
      repoResult: _repo.createWarehouseInput(params),
      onSuccess: (WarehouseInputModel model) async {
        return WarehouseInputDto.fromModel(model);
      },
    );
  }
}
