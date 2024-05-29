// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/src/bloc.dart';
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/domain/dtos/user_detail_dto.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/user/get_user_detail_usecase.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';
part 'user_state.dart';

UserBloc get userBloc => getIt<UserBloc>();

@lazySingleton
class UserBloc extends BaseBloc with AddressBlocMixin {
  UserBloc(this._getUserDetail) : super(InitialState()) {
    onLoad<OnGetUserDetail>(_onGetUserDetail);
  }
  final GetUserDetailUseCase _getUserDetail;

  FutureOr<void> _onGetUserDetail(OnGetUserDetail event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getUserDetail.call(noParam),
      emit: emit.call,
      onSuccess: (UserDetailDto result) {
        Global.setUserDetail(result);
        return GetUserDetailSuccess(result);
      },
    );
  }
}
