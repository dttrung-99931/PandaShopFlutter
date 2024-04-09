// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/shopping_cart/data/models/request/shopping_cart/upsert_cart_request_model.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/repos/shopping_cart_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpsertCartItemUseCase extends EitherUseCase<dynamic, UpsertCartRequestModel> {
  // cart id
  final ShoppingCartRepo _repo;

  UpsertCartItemUseCase(this._repo);

  @override
  Future<Either<Failure, dynamic>> call(UpsertCartRequestModel param) async {
    return handleRepoResult(
      repoResult: _repo.upsertCartItem(param),
      onSuccess: (dynamic model) async {},
    );
  }
}
