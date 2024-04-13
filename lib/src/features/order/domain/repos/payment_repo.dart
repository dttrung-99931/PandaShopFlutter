import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/order/data/models/response/payment_method_model.dart';

abstract class PaymentRepo extends BaseRepo {
  Future<Either<Failure, List<PaymentMethodModel>>> getPaymentMethods();
}
