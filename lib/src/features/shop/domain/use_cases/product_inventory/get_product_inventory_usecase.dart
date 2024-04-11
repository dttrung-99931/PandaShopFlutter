// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_renaming_method_parameters
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/shop/data/models/response/warehouse/product_inventory_model.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/product_inventory_dto.dart';
import 'package:evievm_app/src/features/shop/domain/repositories/warehouse_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
// EitherUseCase<ProductInventoryResponseDto, productId>
class GetProductInventoryUseCase extends EitherUseCase<ProductInventoryDto, int> {
  final WarehouseRepo _repo;
  GetProductInventoryUseCase(
    this._repo,
  );

  @override
  Future<Either<Failure, ProductInventoryDto>> call(int productId) {
    return handleRepoResult(
      repoResult: _repo.getProductInventory(productId),
      onSuccess: (ProductInventoryModel model) async {
        return ProductInventoryDto.fromModel(model);
      },
    );
  }
}
