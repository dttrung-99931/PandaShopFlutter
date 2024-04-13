import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/order/data/data_sources/payment_data_soruce.dart';
import 'package:evievm_app/src/features/order/data/models/response/payment_method_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/payment_repo.dart';

@LazySingleton(as: PaymentRepo)
class PaymentRepoImpl extends PaymentRepo {
  final PaymentDatasource datasource;

  PaymentRepoImpl(this.datasource);

  @override
  Future<Either<Failure, List<PaymentMethodModel>>> getPaymentMethods() {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getPaymentMethods(),
      ),
    );
  }
}
