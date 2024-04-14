import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/order/data/data_sources/order_data_source.dart';
import 'package:evievm_app/src/features/order/data/models/request/order_request_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/order_repo.dart';

@LazySingleton(as: OrderRepo)
class OrderRepoImpl extends OrderRepo {
  final OrderDatasource datasource;

  OrderRepoImpl(this.datasource);

  @override
  Future<Either<Failure, dynamic>> createOrder(OrderRequestModel param) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.createOrder(param),
      ),
    );
  }
}
