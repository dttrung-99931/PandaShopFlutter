import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/common/data/models/response/user/user_detail_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'user_data_source.g.dart';

@module
abstract class UserDatasourceProvider {
  @singleton
  UserDatasource provideUserDatasource(Dio dio) {
    return _UserDatasource(dio);
  }
}

@RestApi()
abstract class UserDatasource {
  @GET('/v1/Users/me')
  Future<BaseResponse<UserDetailModel>> getUserDetail();
}
