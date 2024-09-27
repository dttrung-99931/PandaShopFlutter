import 'package:dio/dio.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/core/utils/storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final Storage _storage;

  AuthInterceptor(this._storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_storage.token != null) {
      options.headers['Authorization'] = 'Bearer ${_storage.token}';
    } else {
      loge('Token is not set');
    }
    return handler.next(options);
  }
}
