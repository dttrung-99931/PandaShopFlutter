import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/order/data/data_sources/order_data_source.dart';
import 'package:evievm_app/src/features/order/data/models/request/get_orders_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/request/order_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
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

  @override
  Future<Either<Failure, List<OrderResponseModel>>> getOrders(GetOrdersRequestModel param) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getOrders(param),
      ),
    );
  }

  @override
  Future<Either<Failure, dynamic>> completeProcessingOrder(int orderId) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.startProcessingOrder(orderId),
      ),
    );
  }

  @override
  Future<Either<Failure, dynamic>> startProcessingOrder(int orderId) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.completeProcessingOrder(orderId),
      ),
    );
  }
}
