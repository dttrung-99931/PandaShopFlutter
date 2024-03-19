import 'package:evievm_app/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:evievm_app/src/features/auth/data/models/request/login_request_model.dart';
import 'package:evievm_app/src/features/auth/data/models/request/qr_barcode_request_model.dart';
import 'package:evievm_app/src/features/auth/data/models/response/login_response_model.dart';
import 'package:evievm_app/src/features/auth/data/models/response/user_profile_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repo.dart';
import '../data_sources/auth_remote_data_soruce.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final AuthRepoteDatasource datasource;

  AuthRepoImpl(this.datasource);

  @override
  Future<Either<Failure, LoginResponseModel>> login(LoginRequestModel param) async {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.login(param),
      ),
    );
  }

  @override
  Future<Either<Failure, UserProfileModel>> getProfile() {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getProfile(),
      ),
    );
  }

  @override
  Future<Either<Failure, LoginResponseModel>> loginByQrcode(QrBarCodeLoginRequestModel param) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.loginByQrcode(param),
      ),
    );
  }

  @override
  Future<Either<Failure, LoginResponseModel>> loginByBarcode(QrBarCodeLoginRequestModel param) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.loginByBarcode(param),
      ),
    );
  }
}
