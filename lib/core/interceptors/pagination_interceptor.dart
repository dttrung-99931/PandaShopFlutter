
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


import '../../src/config/app_config.dart';

/// Change json structure to match structure of [PaginatedList]
@lazySingleton
class PaginationInterceptor extends Interceptor {
  PaginationInterceptor();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    response.data['meta'] = response.data;
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (AppConfig.config.logCurl) {
      handler.next(err);
    } else {
      handler.reject(err);
    }
  }
}
