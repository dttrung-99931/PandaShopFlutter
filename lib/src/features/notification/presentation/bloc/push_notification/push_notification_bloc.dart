// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/notification/data/models/request/notification_receiver_request_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_dto.dart';
import 'package:evievm_app/src/features/notification/domain/use_cases/create_notification_receiver_usecase.dart';
import 'package:evievm_app/src/features/notification/domain/use_cases/fcm_notification_usecases.dart';
import 'package:evievm_app/src/features/notification/domain/use_cases/push_notification_usecases.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_communication.dart';
import 'package:injectable/injectable.dart';

part 'push_notification_event.dart';
part 'push_notification_state.dart';

PushNotificationBloc get pushNotificationBloc => getIt<PushNotificationBloc>();

@lazySingleton
class PushNotificationBloc extends BaseBloc {
  PushNotificationBloc(
    this._pushNotiUseCases,
    this._fcmNotiUseCase,
    this._createReceiver,
  ) : super(InitialState()) {
    on<OnConfigPushNotification>(_onConfigPushNotification);
    on<OnPushNotification>(_onPushNotification);
    on<OnCreateFCMNotificationReceiver>(_onCreateFCMNotificationReceiver);
  }
  final PushNotificationUseCases _pushNotiUseCases;
  final FCMNotificationsUseCases _fcmNotiUseCase;
  final CreateNotificationReceiverUseCase _createReceiver;

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

  FutureOr<void> _onCreateFCMNotificationReceiver(
    OnCreateFCMNotificationReceiver event,
    Emitter<BaseState> emit,
  ) async {
    String? token = await handleUsecaseResult<String?>(
      usecaseResult: _fcmNotiUseCase.getFcmNotificationToken(),
      emit: emit,
      showErrorWhenFail: false,
    );

    if (token != null) {
      handleUsecaseResult(
          usecaseResult: _createReceiver.call(
            NotificationReceiverRequestModel(token: token, senderType: NotificationSenderType.fcm),
          ),
          showErrorWhenFail: false,
          emit: emit,
          onError: (f) {
            // TODO: handle warning user
            return ErrorState(f);
          });
    } else {
      // TODO:
    }
  }
}
