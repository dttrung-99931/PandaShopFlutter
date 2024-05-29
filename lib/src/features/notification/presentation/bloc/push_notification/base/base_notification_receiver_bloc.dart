// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/src/bloc.dart';
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_dto.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_bloc.dart';

abstract class BaseNotificationReceiverBloc extends BaseBloc {
  BaseNotificationReceiverBloc(super.initialState) {
    on<OnConfigNotiReceiver>(onConfig);
    on<OnReceivedNotification>(_onReceivedNotification);
  }

  NotificationReceived buildNotificationReceiverState(PushNotificationDto noti);
  FutureOr<void> onConfig(OnConfigNotiReceiver event, Emitter<BaseState> emit);

  PushNotificationModel? _parsePushNotification(Map<String, dynamic> pushNotiJson) {
    try {
      PushNotificationModel notiModel = PushNotificationModel.fromJson(pushNotiJson);
      return notiModel;
    } catch (e) {
      loge('$runtimeType Parse noti exception: $e');
    }
    return null;
  }

  FutureOr<void> _onReceivedNotification(OnReceivedNotification event, Emitter<BaseState> emit) {
    PushNotificationModel? notiModel = _parsePushNotification(event.notiData);
    if (notiModel != null) {
      PushNotificationDto noti = PushNotificationDto.fromModel(notiModel);
      emit(buildNotificationReceiverState(noti));
    }
  }
}
