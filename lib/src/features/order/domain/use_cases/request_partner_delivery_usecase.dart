import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/order/data/models/request/request_partner_delivery_request_model.dart';
import 'package:evievm_app/src/features/order/domain/repos/order_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RequestPartnerDeliveryUsecase extends EitherUseCase<dynamic, RequestPartnerDeliveryRequestModel> {
  final OrderRepo _repo;

  RequestPartnerDeliveryUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(RequestPartnerDeliveryRequestModel param) async {
    return handleRepoResult(
      repoResult: _repo.requestPartnerDelivery(param),
      onSuccess: (void model) async {},
    );
  }
}
