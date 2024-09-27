import 'package:dio/dio.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:injectable/injectable.dart';

import '../../src/config/app_config.dart';

@lazySingleton
class ApiLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (AppConfig.config.logRequest) {
      logd('  Request');
      logd('    ${options.uri}');
      logd('    ${options.data}', maxLength: 1000);
      logd('');
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (AppConfig.config.logResponse) {
      logd('  Response');
      logd('     $response', maxLength: 1000);
    }
    super.onResponse(response, handler);
  }
}
