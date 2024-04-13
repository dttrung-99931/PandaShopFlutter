import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/order/domain/repos/payment_repo.dart';
import 'package:evievm_app/src/features/order/data/models/response/payment_method_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/payement_method_dto.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPaymentMethodsUseCase extends EitherUseCase<List<PaymentMethodDto>, NoParams> {
  final PaymentRepo _repo;

  GetPaymentMethodsUseCase(this._repo);

  @override
  Future<Either<Failure, List<PaymentMethodDto>>> call(NoParams param) async {
    return handleRepoResult(
      repoResult: _repo.getPaymentMethods(),
      onSuccess: (List<PaymentMethodModel> model) async {
        return model.map((e) => PaymentMethodDto.fromModel(e)).toList();
      },
    );
  }
}
