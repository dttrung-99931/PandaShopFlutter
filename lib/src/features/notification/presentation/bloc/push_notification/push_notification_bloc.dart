// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_payload.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_dto.dart';
import 'package:evievm_app/src/features/notification/domain/use_cases/push_notification_usecases.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/base/base_notification_receiver_bloc.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_communication.dart';
import 'package:injectable/injectable.dart';

part 'push_notification_event.dart';
part 'push_notification_state.dart';

PushNotificationBloc get pushNotificationBloc => getIt<PushNotificationBloc>();

@lazySingleton
class PushNotificationBloc extends BaseBloc {
  PushNotificationBloc(this._pushNotiUseCases) : super(InitialState()) {
    on<OnConfigNotification>(_onConfigPushNotification);
    on<OnPushNotification>(_onPushNotification);
    on<OnPushNotificationPressed>(_onPushNotificationPressed);
  }
  final PushNotificationUseCases _pushNotiUseCases;

  @override
  PushNotificationCommunication get blocCommunication => getIt<PushNotificationCommunication>();

  FutureOr<void> _onConfigPushNotification(OnConfigNotification event, Emitter<BaseState> emit) async {
    blocCommunication.configNotiReceivers(event);
    await handleUsecaseResult(
      usecaseResult: _pushNotiUseCases.config(PushNotificationConfig(
        onNotiSelected: (PushNotificationPayload payload) {
          add(OnPushNotificationPressed(data: payload));
        },
      )),
      emit: emit,
      showErrorWhenFail: false,
    );
    emit(ConfigPushNotificationComplete());
  }

  FutureOr<void> _onPushNotification(OnPushNotification event, Emitter<BaseState> emit) {
    handleUsecaseResult(
      usecaseResult: _pushNotiUseCases.pushNoti(event.noti),
      emit: emit,
      showErrorWhenFail: false,
    );
  }

  FutureOr<void> _onPushNotificationPressed(OnPushNotificationPressed event, Emitter<BaseState> emit) {
    emit(PushNotificationPressed(event.data));
  }
}
