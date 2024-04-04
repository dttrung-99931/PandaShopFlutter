// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/shop/domain/repositories/shop_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterShopUseCase extends EitherUseCase<dynamic, ShopParams> {
  final ShopRepo _repo;
  RegisterShopUseCase(
    this._repo,
  );

  @override
  Future<Either<Failure, dynamic>> call(ShopParams param) {
    return handleRepoResult(
      repoResult: _repo.registerShop(param),
      onSuccess: (model) async {},
    );
  }
}
