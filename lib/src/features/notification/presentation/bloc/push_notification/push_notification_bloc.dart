// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification_dto.dart';
import 'package:evievm_app/src/features/notification/domain/use_cases/push_notification_usecase.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_communication.dart';
import 'package:injectable/injectable.dart';

part 'push_notification_event.dart';
part 'push_notification_state.dart';

PushNotificationBloc get pushNotificationBloc => getIt<PushNotificationBloc>();

@lazySingleton
class PushNotificationBloc extends BaseBloc {
  PushNotificationBloc(this._pushNotiUseCases) : super(InitialState()) {
    on<OnConfigPushNotification>(_onConfigPushNotification);
    on<OnPushNotification>(_onPushNotification);
  }
  final PushNotificationUseCases _pushNotiUseCases;

  @override
  PushNotificationCommunication get blocCommunication => getIt<PushNotificationCommunication>();

  FutureOr<void> _onConfigPushNotification(OnConfigPushNotification event, Emitter<BaseState> emit) async {
    blocCommunication.config();
    handleUsecaseResult(
      usecaseResult: _pushNotiUseCases.config(),
      emit: emit,
      showErrorWhenFail: false,
    );
  }

  FutureOr<void> _onPushNotification(OnPushNotification event, Emitter<BaseState> emit) {
    handleUsecaseResult(
      usecaseResult: _pushNotiUseCases.pushNoti(event.noti),
      emit: emit,
      showErrorWhenFail: false,
    );
  }
}
