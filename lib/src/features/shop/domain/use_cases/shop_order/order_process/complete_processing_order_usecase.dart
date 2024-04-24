// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/order/domain/repos/order_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CompleteProcessingOrderUseCase extends EitherUseCase<dynamic, int> {
  final OrderRepo _repo;
  CompleteProcessingOrderUseCase(this._repo);

  @override
  Future<Either<Failure, dynamic>> call(int orderId) {
    return handleRepoResult(
      repoResult: _repo.completeProcessingOrder(orderId),
      onSuccess: (model) async {},
    );
  }
}
