// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/data/models/response/shopping_cart/shopping_cart_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/product/domain/repos/shopping_cart_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetShoppingCartUseCase extends EitherUseCase<ShoppingCartDto, int> {
  // cart id
  final ShoppingCartRepo _repo;

  GetShoppingCartUseCase(this._repo);

  @override
  Future<Either<Failure, ShoppingCartDto>> call(int id) async {
    return handleRepoResult(
      repoResult: _repo.getShoppingCart(id),
      onSuccess: (ShoppingCartModel model) async {
        return ShoppingCartDto.fromModel(model);
      },
    );
  }
}
