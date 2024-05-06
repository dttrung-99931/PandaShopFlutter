// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/src/bloc.dart';
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_dto.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_bloc.dart';

abstract class BaseNotificationReceiverBloc<TConfigEvent extends OnConfigNotiReceiver> extends BaseBloc {
  BaseNotificationReceiverBloc(super.initialState) {
    on<TConfigEvent>(onConfig);
  }

  NotificationReceived buildNotificationReceiverState(PushNotificationDto noti);
  FutureOr<void> onConfig(TConfigEvent event, Emitter<BaseState> emit);

  void onNotification(Map<String, dynamic> pushNotiJson) {
    PushNotificationModel? notiModel = _parsePushNotification(pushNotiJson);
    if (notiModel != null) {
      PushNotificationDto noti = PushNotificationDto.fromModel(notiModel);
      add(OnSetState(buildNotificationReceiverState(noti)));
    }
  }

  PushNotificationModel? _parsePushNotification(Map<String, dynamic> pushNotiJson) {
    try {
      PushNotificationModel notiModel = PushNotificationModel.fromJson(pushNotiJson);
      return notiModel;
    } catch (e) {
      loge('Parse signalR noti exception: $e');
    }
    return null;
  }
}
