import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/order/data/models/request/get_orders_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/request/create_orders_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/request/request_partner_delivery_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_with_orders_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/temp_delivery_response_model.dart';

abstract class OrderRepo extends BaseRepo {
  Future<Either<Failure, dynamic>> createOrder(CreateOrdersRequestModel param);
  Future<Either<Failure, List<OrderResponseModel>>> getOrders(GetOrdersRequestModel param);
  Future<Either<Failure, dynamic>> startProcessingOrder(int orderId);
  Future<Either<Failure, dynamic>> completeProcessingOrder(int orderId);
  Future<Either<Failure, List<TempDeliveryResponseModel>>> getCompleteProcessingOrders();
  Future<Either<Failure, List<DeliveryWithOrdersResponseModel>>> getWaitingDeliveryOrders();
  Future<Either<Failure, List<DeliveryWithOrdersResponseModel>>> getDeliveringOrders();
  Future<Either<Failure, void>> requestPartnerDelivery(RequestPartnerDeliveryRequestModel param);
}
