import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/order/data/models/request/get_orders_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/request/create_orders_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/request/request_partner_delivery_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_with_orders_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/temp_delivery_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'order_data_source.g.dart';

@module
abstract class OrderDatasourceProvider {
  @singleton
  OrderDatasource provideOrderDatasource(Dio dio) {
    return _OrderDatasource(dio);
  }
}

@RestApi()
abstract class OrderDatasource {
  @POST('/v1/Orders')
  Future<BaseResponse> createOrder(@Body() CreateOrdersRequestModel param);

  @GET('/v1/Orders')
  Future<BaseResponse<List<OrderResponseModel>>> getOrders(@Queries() GetOrdersRequestModel param);

  @PUT('/v1/Orders/{orderId}/StartProcessing')
  Future<BaseResponse> startProcessingOrder(@Path() int orderId);

  @PUT('/v1/Orders/{orderId}/CompleteProcessing')
  Future<BaseResponse> completeProcessingOrder(@Path() int orderId);

  @GET('/v1/Orders/CompleteProcessing')
  Future<BaseResponse<List<TempDeliveryResponseModel>>> getCompleteProcessingOrders();

  @GET('/v1/Orders/WaitingPartnerDelivery')
  Future<BaseResponse<List<DeliveryWithOrdersResponseModel>>> getWaitingPartnerDeliveryOrders();

  @POST('/v1/Orders/RequestPartnerDelivery')
  Future<BaseResponse<List<TempDeliveryResponseModel>>> requestPartnerDelivery(
      @Body() RequestPartnerDeliveryRequestModel param);
}
