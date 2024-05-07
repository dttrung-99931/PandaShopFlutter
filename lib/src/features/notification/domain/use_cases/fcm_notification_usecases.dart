// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/core/utils/mixins/disposable_mixin.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/fcm_bloc/fcm_bloc.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

class FCMConfig {
  final Function(Map<String, dynamic> notiData)? onForcegroundNoti;
  FCMConfig({
    this.onForcegroundNoti,
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
      _listenForgroundNoti(fcmConfig);
      _listenBackgroundNoti();
      // TODO: show push noti when app terminated.
      // Hanlde on not presseed"\
      // - When app termiated
      // - When in background
      // - When in forground
      return FCMConfigResult.fromFCMAuthorizationStatus(settings.authorizationStatus);
    });
  }

  void _listenForgroundNoti(FCMConfig fcmConfig) {
    addSubscription(FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      String? data = event.data['data'];
      if (isNullOrEmpty(data)) {
        logd('Invalid fcm notification ${event.data}');
        return;
      }
      fcmConfig.onForcegroundNoti?.call(jsonDecode(data!));
    }));
  }

  void _listenBackgroundNoti() {
    FirebaseMessaging.onBackgroundMessage(_onBackgroundNoti);
  }
}

@pragma('vm:entry-point') // <- Bypass tree shaking when building release
Future<void> _onBackgroundNoti(RemoteMessage message) async {
  await Firebase.initializeApp();
  await AppConfig.autoConfigByBundleId();
  await configureDependencies();
  pushNotificationBloc.add(OnConfigNotification(notiReceiverBlocs: [fcmBloc]));
  pushNotificationBloc.stream.listen((BaseState state) {
    if (state is ConfigPushNotificationComplete) {
      fcmBloc.add(OnReceivedNotification.fromNotiDataJsonString(message.data['data']));
    }
  });
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
