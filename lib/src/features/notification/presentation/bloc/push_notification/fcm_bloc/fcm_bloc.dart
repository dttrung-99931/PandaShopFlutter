// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/notification/data/models/request/notification_receiver_request_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_dto.dart';
import 'package:evievm_app/src/features/notification/domain/use_cases/create_notification_receiver_usecase.dart';
import 'package:evievm_app/src/features/notification/domain/use_cases/fcm_notification_usecases.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/base/base_notification_receiver_bloc.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_bloc.dart';
import 'package:injectable/injectable.dart';

part 'fcm_event.dart';
part 'fcm_state.dart';

FCMBloc get fcmBloc => getIt<FCMBloc>();

@lazySingleton
class FCMBloc extends BaseNotificationReceiverBloc {
  FCMBloc(
    this._createReceiver,
    this._fcmNotiUseCase,
  ) : super(InitialState()) {
    on<OnCreateFCMNotificationReceiver>(_onCreateFCMNotificationReceiver);
  }
  final CreateNotificationReceiverUseCase _createReceiver;
  final FCMNotificationsUseCases _fcmNotiUseCase;

  @override
  FutureOr<void> onConfig(OnConfigNotiReceiver event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _fcmNotiUseCase.config(FCMConfig(
        onForcegroundNoti: (Map<String, dynamic> notiData) {
          if (!isClosed) {
            add(OnReceivedNotification.fromNotiDataJson(notiData: notiData));
          }
        },
      )),
      emit: emit.call,
      showErrorWhenFail: false,
      onError: (failure) {
        // TODO:
        return ErrorState(failure);
      },
    );
  }

  @override
  NotificationReceived buildNotificationReceiverState(PushNotificationDto noti) {
    return FCMNotificationReceived(noti);
  }

  FutureOr<void> _onCreateFCMNotificationReceiver(
    OnCreateFCMNotificationReceiver event,
    Emitter<BaseState> emit,
  ) async {
    String? token = await handleUsecaseResult<String?>(
      usecaseResult: _fcmNotiUseCase.getFcmNotificationToken(),
      emit: emit.call,
      showErrorWhenFail: false,
    );

    if (token != null) {
      handleUsecaseResult(
          usecaseResult: _createReceiver.call(
            NotificationReceiverRequestModel(token: token, senderType: NotificationSenderType.fcm),
          ),
          showErrorWhenFail: false,
          emit: emit.call,
          onError: (f) {
            // TODO: handle warning user
            return ErrorState(f);
          });
    } else {
      // TODO:
    }
  }
}
