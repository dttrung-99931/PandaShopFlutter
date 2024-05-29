import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/order/data/models/response/payment_method_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_data_soruce.g.dart';

@module
abstract class PaymentDatasourceProvider {
  @singleton
  PaymentDatasource providePaymentDatasource(Dio dio) {
    return _PaymentDatasource(dio);
  }
}

@RestApi()
abstract class PaymentDatasource {
  @GET('/v1/PaymentMethods')
  Future<BaseResponse<List<PaymentMethodModel>>> getPaymentMethods();
}
