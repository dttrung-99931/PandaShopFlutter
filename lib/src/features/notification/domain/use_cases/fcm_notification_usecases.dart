// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/core/utils/mixins/disposable_mixin.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_dto.dart';

class FCMConfig {
  final Function(PushNotificationDto noti)? onReceivedNoti;
  FCMConfig({
    this.onReceivedNoti,
  });
}

@lazySingleton
class FCMNotificationsUseCases with DisposableMixin {
  FCMNotificationsUseCases();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<Either<Failure, String?>> getFcmNotificationToken() async {
    return executeWithTryCatch(() async {
      String? token = await _messaging.getToken();
      return token;
    });
  }

  Future<Either<Failure, FCMConfigResult>> config(FCMConfig fcmConfig) async {
    return executeWithTryCatch(() async {
      disposeAllSubscriptions();

      NotificationSettings settings = await _messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      addSubscription(FirebaseMessaging.onMessage.listen((RemoteMessage event) {
        String? data = event.data['data'];
        if (isNullOrEmpty(data)) {
          logd('Invalid fcm notification ${event.data}');
          return;
        }
        logd('Fcm noti:');
        logd(data ?? '');
        PushNotificationModel model = PushNotificationModel.fromJson(jsonDecode(data!));
        PushNotificationDto noti = PushNotificationDto.fromModel(model);
        fcmConfig.onReceivedNoti?.call(noti);
      }));

      return FCMConfigResult.fromFCMAuthorizationStatus(settings.authorizationStatus);
    });
  }
}

enum FCMConfigResult {
  success,
  permissionDenied;

  static FCMConfigResult fromFCMAuthorizationStatus(AuthorizationStatus status) {
    switch (status) {
      case AuthorizationStatus.authorized:
      case AuthorizationStatus.provisional:
        return FCMConfigResult.success;
      case AuthorizationStatus.denied:
      case AuthorizationStatus.notDetermined:
        return FCMConfigResult.permissionDenied;
    }
  }
}
