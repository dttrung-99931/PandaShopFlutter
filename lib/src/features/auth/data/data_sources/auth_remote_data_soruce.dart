import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/auth/data/models/request/login_request_model.dart';
import 'package:evievm_app/src/features/auth/data/models/response/login_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/request/qr_barcode_request_model.dart';
import '../models/request/user_profile_request_model.dart';
import '../models/response/user_profile_model.dart';

part 'auth_remote_data_soruce.g.dart';

@module
abstract class AuthRepoteDatasourceProvider {
  @singleton
  AuthRepoteDatasource provideAuthRepoteDatasource(Dio dio) {
    return _AuthRepoteDatasource(dio);
  }
}

@RestApi()
abstract class AuthRepoteDatasource {
  @POST('/v1/Users/login')
  Future<BaseResponse<LoginResponseModel?>> login(@Body() LoginRequestModel param);

  @POST('/api/auth/loginQR')
  Future<BaseResponse<LoginResponseModel?>> loginByQrcode(@Body() QrBarCodeLoginRequestModel param);

  @POST('/api/auth/loginBarcode')
  Future<BaseResponse<LoginResponseModel?>> loginByBarcode(@Body() QrBarCodeLoginRequestModel param);

  @GET('/api/profile/me')
  Future<BaseResponse<UserProfileModel?>> getProfile();

  @PUT('/api/profile/me')
  Future<BaseResponse<UserProfileModel?>> updateProfile(@Body() UserProfileRequestModel param);
}
