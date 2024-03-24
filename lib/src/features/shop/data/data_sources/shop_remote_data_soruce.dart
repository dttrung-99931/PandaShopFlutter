import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'shop_remote_data_soruce.g.dart';

@module
abstract class ShopRepoteDatasourceProvider {
  @singleton
  ShopRemoteDatasource provideShopRepoteDatasource(Dio dio) {
    return _ShopRemoteDatasource(dio);
  }
}

@RestApi()
abstract class ShopRemoteDatasource {}
