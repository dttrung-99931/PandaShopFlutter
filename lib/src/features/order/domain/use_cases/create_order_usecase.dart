import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/order/data/models/request/order_request_model.dart';
import 'package:evievm_app/src/features/order/domain/repos/order_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateOrderUseCase extends EitherUseCase<dynamic, OrderRequestModel> {
  final OrderRepo _repo;

  CreateOrderUseCase(this._repo);

  @override
  Future<Either<Failure, dynamic>> call(OrderRequestModel params) async {
    return handleRepoResult(
      repoResult: _repo.createOrder(params),
      onSuccess: (dynamic model) async {},
    );
  }
}
