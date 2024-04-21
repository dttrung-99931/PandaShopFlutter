import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/order/data/models/request/get_orders_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/request/order_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
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
  Future<BaseResponse> createOrder(@Body() OrderRequestModel param);

  @GET('/v1/Orders')
  Future<BaseResponse<List<OrderResponseModel>>> getOrders(@Queries() GetOrdersRequestModel param);
}
