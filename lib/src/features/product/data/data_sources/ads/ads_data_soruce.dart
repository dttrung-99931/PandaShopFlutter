import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/product/data/models/response/home/home_banner_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'ads_data_soruce.g.dart';

@module
abstract class AdsDatasourceProvider {
  @singleton
  AdsDatasource provideAdsDatasource(Dio dio) {
    return _AdsDatasource(dio);
  }
}

@RestApi()
abstract class AdsDatasource {
  @GET('/v1/Ads/HomeBanners')
  Future<BaseResponse<List<HomeBannerModel>>> getHomeBanners();
}
