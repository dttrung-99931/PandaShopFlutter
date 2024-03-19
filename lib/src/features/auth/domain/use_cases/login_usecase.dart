// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_renaming_method_parameters
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/storage.dart';
import 'package:evievm_app/src/features/auth/data/models/request/login_request_model.dart';
import 'package:evievm_app/src/features/auth/domain/login_response_dto.dart';
import 'package:evievm_app/src/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/response/login_response_model.dart';

class LoginParams {
  final LoginRequestModel requestModel;
  final bool rememberEmail;

  LoginParams({required this.requestModel, required this.rememberEmail});
}

@lazySingleton
class EmailLoginUseCase extends EitherUseCase<LoginResponseDto?, LoginParams> {
  final AuthRepo _repo;
  final Storage _storage;

  EmailLoginUseCase(
    this._repo,
    this._storage,
  );

  @override
  Future<Either<Failure, LoginResponseDto>> call(LoginParams loginParam) async {
    return handleRepoResult(
      repoResult: _repo.login(loginParam.requestModel),
      nextRepoResult: (LoginResponseModel loginResponse) {
        return onLoginSuccess(loginResponse, loginParam: loginParam);
      },
      onError: (Failure failure) async {
        return failure;
      },
    );
  }

  // Save token, user profile
  Future<Either<Failure, LoginResponseDto>> onLoginSuccess(
    LoginResponseModel loginResponse, {
    LoginParams? loginParam,
  }) async {
    await _storage.saveToken(loginResponse.token);
    return Right(LoginResponseDto.fromModel(loginResponse));

    // TODO: handle get profile
    // return await handleRepoResult<LoginResponseDto, UserProfileModel>(
    //   repoResult: _repo.getProfile(),
    //   onSuccess: (UserProfileModel profile) async {
    //     await Future.wait([
    //       _storage.saveUserProfile(profile),
    //       if (loginParam != null)
    //         loginParam.rememberEmail
    //             ? _storage.saveLoginEmail(loginParam.requestModel.email)
    //             : _storage.deleteLoginEmail()
    //     ]);
    //     return LoginResponseDto.fromModel(loginResponse);
    //   },
    //   onError: (failure) async {
    //     _storage.deleteToken();
    //     return failure;
    //   },
    // );
  }
}
