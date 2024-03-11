import 'dart:io';

import 'package:dio/io.dart';
import 'package:evievm_app/core/interceptors/api_interceptor.dart';
import 'package:evievm_app/core/utils/curl_logger_dio_interceptor.dart';
import 'package:evievm_app/core/utils/storage.dart';
import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/src/config/di/injection.config.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Used to quick assess to GetIt instead of call GetIt.instance
final GetIt getIt = GetIt.instance;

@InjectableInit(generateForDir: ["lib"])
configureDependencies() => $initGetIt(getIt);

// Provide dependencies used in whole app
@module
abstract class AppModuleDepedenciesProvider {
  @singleton
  Dio provideNetworkDio(ApiInterceptor interceptor) {
    var baseOptions = BaseOptions(
      baseUrl: AppConfig.config.apiUrl,
      validateStatus: (status) {
        return [200, 201, 204, 404, 422].contains(status);
      },
    );
    final dio = Dio(baseOptions);
    dio.interceptors.add(interceptor);
    if (AppConfig.config.logCurl) {
      dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    }
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =(HttpClient httpClient) {
      httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return httpClient;
    };
    return dio;
  }

  @lazySingleton
  @preResolve
  Future<Storage> provideStorage() {
    return Storage().init();
  }
}
