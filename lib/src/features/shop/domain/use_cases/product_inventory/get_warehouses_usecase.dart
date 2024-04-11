// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_renaming_method_parameters
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/warehouse_model.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/warehouse_dto.dart';
import 'package:evievm_app/src/features/shop/domain/repositories/warehouse_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
// EitherUseCase<ProductInventoryResponseDto, productId>
class GetWarehousesUseCase extends EitherUseCase<List<WarehouseDto>, NoParams> {
  final WarehouseRepo _repo;
  GetWarehousesUseCase(
    this._repo,
  );

  @override
  Future<Either<Failure, List<WarehouseDto>>> call(NoParams productId) {
    return handleRepoResult(
      repoResult: _repo.getWarehouses(),
      onSuccess: (List<WarehouseModel> model) async {
        return model.mapList((element) => WarehouseDto.fromModel(element));
      },
    );
  }
}
