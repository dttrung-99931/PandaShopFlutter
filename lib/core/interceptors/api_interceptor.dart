
import 'package:dio/dio.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/utils/storage.dart';

import '../../src/config/app_config.dart';

@lazySingleton
class ApiInterceptor extends Interceptor {
  final Storage _storage;
  // TODO: beauty json
  // final JsonEncoder _encoder = const JsonEncoder.withIndent(' ');

  ApiInterceptor(this._storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_storage.token != null) {
      options.headers['Authorization'] = 'Bearer ${_storage.token}';
    } else {
      loge('Token is not set');
    }

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

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (AppConfig.config.logCurl) {
      handler.next(err);
    } else {
      handler.reject(err);
    }
  }
}
