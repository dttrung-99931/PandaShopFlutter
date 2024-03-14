// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/domain/repos/shopping_cart_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteCartItemsUseCase extends EitherUseCase<dynamic, List<int>> {
  // cart id
  final ShoppingCartRepo _repo;

  DeleteCartItemsUseCase(this._repo);

  @override
  Future<Either<Failure, dynamic>> call(List<int> itemIds) async {
    return handleRepoResult(
      repoResult: _repo.deleteCartItems(itemIds),
      onSuccess: (dynamic model) async {},
    );
  }
}
