import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/order/data/data_sources/order_data_source.dart';
import 'package:evievm_app/src/features/order/data/models/request/get_orders_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/request/create_orders_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/request/request_partner_delivery_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_with_orders_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/temp_delivery_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/order_repo.dart';

@LazySingleton(as: OrderRepo)
class OrderRepoImpl extends OrderRepo {
  final OrderDatasource datasource;

  OrderRepoImpl(this.datasource);

  @override
  Future<Either<Failure, dynamic>> createOrder(CreateOrdersRequestModel param) {
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
        datasourceResponse: datasource.completeProcessingOrder(orderId),
      ),
    );
  }

  @override
  Future<Either<Failure, dynamic>> startProcessingOrder(int orderId) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.startProcessingOrder(orderId),
      ),
    );
  }

  @override
  Future<Either<Failure, List<TempDeliveryResponseModel>>> getCompleteProcessingOrders() {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getCompleteProcessingOrders(),
      ),
    );
  }

  @override
  Future<Either<Failure, void>> requestPartnerDelivery(RequestPartnerDeliveryRequestModel param) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.requestPartnerDelivery(param),
      ),
    );
  }

  @override
  Future<Either<Failure, List<DeliveryWithOrdersResponseModel>>> getWaitingDeliveryOrders() {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getWaitingPartnerDeliveryOrders(),
      ),
    );
  }

  @override
  Future<Either<Failure, List<DeliveryWithOrdersResponseModel>>> getDeliveringOrders() {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getDeliveringOrders(),
      ),
    );
  }
}
