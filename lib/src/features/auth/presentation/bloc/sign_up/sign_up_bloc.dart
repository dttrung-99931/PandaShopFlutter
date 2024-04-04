import 'package:bloc/src/bloc.dart';
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/auth/data/models/request/sign_up_request_model.dart';
import 'package:evievm_app/src/features/auth/domain/use_cases/sign_up_usecase.dart';
import 'package:evievm_app/src/features/common/domain/dtos/user_detail_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

SignUpBloc get signUpBloc => getIt();

@lazySingleton
class SignUpBloc extends BaseBloc {
  final phoneEdtController = TextEditingController();
  final passwordEdtController = TextEditingController();
  final passwordConfirmEdtController = TextEditingController();
  final SignUpUseCase _signUp;
  SignUpBloc(this._signUp) : super(InitialState()) {
    onLoad<OnSignUp>(_onSignUp);
  }

  FutureOr<void> _onSignUp(OnSignUp event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _signUp.call(
        SignUpRequestModel(name: 'User ${now.microsecondsSinceEpoch}', phone: event.phone, password: event.password),
      ),
      emit: emit,
      onSuccess: (UserDetailDto result) {
        _clearInput();
        return SignUpSuccess(userDetail: result, event: event);
      },
    );
  }

  void _clearInput() {
    for (var element in [phoneEdtController, passwordConfirmEdtController, passwordEdtController]) {
      element.clear();
    }
  }
}
