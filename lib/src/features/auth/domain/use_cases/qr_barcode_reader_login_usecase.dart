// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/auth/data/models/request/qr_barcode_request_model.dart';
import 'package:evievm_app/src/features/auth/domain/login_response_dto.dart';
import 'package:evievm_app/src/features/auth/domain/repositories/auth_repo.dart';
import 'package:evievm_app/src/features/auth/domain/use_cases/login_usecase.dart';

import '../../data/models/response/login_response_model.dart';

@lazySingleton
class QrBarcodeLoginUseCase extends EitherUseCase<LoginResponseDto?, QrBarCodeLoginRequestModel> {
  final AuthRepo _repo;
  final EmailLoginUseCase _emailLoginUserCase;

  QrBarcodeLoginUseCase(
    this._repo,
    this._emailLoginUserCase,
  );

  @override
  Future<Either<Failure, LoginResponseDto>> call(QrBarCodeLoginRequestModel param) async {
    return handleRepoResult(
      repoResult: param.qrToken != null ? _repo.loginByQrcode(param) : _repo.loginByBarcode(param),
      nextRepoResult: (LoginResponseModel loginResponse) {
        return _emailLoginUserCase.onLoginSuccess(loginResponse);
      },
      onError: (Failure failure) async {
        return failure;
      },
    );
  }
}
