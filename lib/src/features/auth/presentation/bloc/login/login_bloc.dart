// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/validate.dart';
import 'package:evievm_app/src/features/auth/domain/login_response_dto.dart';
import 'package:evievm_app/src/features/auth/domain/use_cases/logout_usecase.dart';
import 'package:evievm_app/src/features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/features/auth/domain/use_cases/email_login_usecase.dart';

import '../../../../../../core/utils/bloc_concurrency.dart';
import '../../../data/models/request/email_login_request_model.dart';
import '../../../data/models/request/qr_barcode_request_model.dart';
import '../../../domain/use_cases/check_login_usecase.dart';
import '../../../domain/use_cases/get_remember_login_email_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

@lazySingleton
class LoginBloc extends BaseBloc {
  final EmailLoginUseCase _emailLoginUseCase;
  final QrBarcodeLoginUseCase _qrBarcodeLoginUseCase;
  final CheckLoginUseCase _checkLoginUseCase;
  final LogoutUseCase _logoutUseCase;
  final GetRememberLoginEmailUserCase _getRememberLoginEmailUserCase;

  LoginBloc(
    this._emailLoginUseCase,
    this._qrBarcodeLoginUseCase,
    this._checkLoginUseCase,
    this._logoutUseCase,
    this._getRememberLoginEmailUserCase,
  ) : super(InitialState()) {
    onLoad<OnEmailLogin>(_onEmailLogin);
    onLoad<OnQrBarcodeReaderLogin>(_onQrBarcodeReaderLogin);
    on<OnCheckLogin>(_onCheckLogin);
    on<OnLogout>(_onLogout);
    on<OnGetRememberLoginEmail>(_onGetRememberLoginEmail);
  }

  Future<void> _onEmailLogin(OnEmailLogin event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _emailLoginUseCase.call(
        EmailLoginParams(
          requestModel: EmailLoginRequestModel(email: event.email, password: event.password, userType: 'lab'),
          rememberEmail: event.rememberEmail,
        ),
      ),
      emit: emit,
      onSuccess: (LoginResponseDto result) {
        return LoginSuccess();
      },
      onError: (failure) {
        return LoginFailed(failure);
      },
    );
  }

  Future<void> _onCheckLogin(OnCheckLogin event, Emitter<BaseState> emit) async {
    bool isLoggedIn = _checkLoginUseCase.call(NoParams());
    emit(CheckLoginSuccess(isLoggedIn));
  }

  Future<void> _onLogout(OnLogout event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _logoutUseCase.call(noParam),
      emit: emit,
      onSuccess: (result) => LogoutSuccess(),
    );
  }

  Future<void> _onGetRememberLoginEmail(OnGetRememberLoginEmail event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getRememberLoginEmailUserCase.call(noParam),
      emit: emit,
      onSuccess: (String? rememberEmail) {
        return GetRememberLoginEmailSuccess(rememberEmail);
      },
    );
  }

  Future<void> _onQrBarcodeReaderLogin(OnQrBarcodeReaderLogin event, Emitter<BaseState> emit) async {
    bool isQrLogin = Validate.isUuid(event.scannedCode);
    await handleUsecaseResult(
      usecaseResult: _qrBarcodeLoginUseCase.call(
        // TODO: make userType -> emum
        QrBarCodeLoginRequestModel(
          qrToken: isQrLogin ? event.scannedCode : null,
          barcode: !isQrLogin ? event.scannedCode : null,
          userType: 'lab',
        ),
      ),
      emit: emit,
      onSuccess: (LoginResponseDto result) {
        return LoginSuccess();
      },
      onError: (failure) {
        // Set qr login failed message for all login errors
        failure.displayMsg = 'auth.login_by_qr_failed'.tr();
        return LoginFailed(failure);
      },
    );
  }
}
