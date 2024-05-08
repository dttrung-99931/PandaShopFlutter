// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_payload.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_dto.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

class PushNotificationConfig {
  final Function(PushNotificationPayload payload)? onNotiSelected;
  PushNotificationConfig({
    this.onNotiSelected,
  });
}

@lazySingleton
class PushNotificationUseCases {
  FlutterLocalNotificationsPlugin? _notificationsPlugin;
  AndroidNotificationChannel? _channel;
  PushNotificationConfig? _configuration;

  Future<Either<Failure, dynamic>> config(PushNotificationConfig config) async {
    if (_notificationsPlugin != null) {
      return const Right('Local noti was configured');
    }
    return executeWithTryCatch(() async {
      await _config(config);
      await _handleInitialNoti();
    });
  }

  Future<void> _config(PushNotificationConfig config) async {
    _configuration = config;
    _notificationsPlugin = FlutterLocalNotificationsPlugin();

    if (Platform.isAndroid) {
      _channel = const AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        importance: Importance.max,
      );
      await _notificationsPlugin
          ?.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_channel!);
    }
    if (Platform.isIOS) {
      await _notificationsPlugin
          ?.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }

    await _notificationsPlugin!.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(), // TODO:
      ),
      onDidReceiveNotificationResponse: _onNotificationSelected,
    );
  }

  // Handle noti navigation when user click notification while app terminated / in background
  Future<void> _handleInitialNoti() async {
    // initital noti is noti that user clicking on to open app when app not opening
    NotificationAppLaunchDetails? initialNoti = await _notificationsPlugin!.getNotificationAppLaunchDetails();
    if (initialNoti != null && initialNoti.notificationResponse != null) {
      _onNotificationSelected(initialNoti.notificationResponse!);
    }
  }

  void _onNotificationSelected(NotificationResponse details) {
    if (details.payload == null) {
      logd('Invalid notificaiton without payload');
      return;
    }
    switch (details.notificationResponseType) {
      case NotificationResponseType.selectedNotification:
        PushNotificationPayload payload = PushNotificationPayload.fromJsonString(details.payload!);
        _configuration!.onNotiSelected?.call(payload);
        break;
      case NotificationResponseType.selectedNotificationAction:
        logd('selectedNotificationAction');
        // TODO:
        break;
    }
  }

  Future<Either<Failure, dynamic>> pushNoti(PushNotificationDto noti) async {
    if (_notificationsPlugin == null) {
      return Left(Failure('Notificaiton plugin is not initialized'));
    }
    return executeWithTryCatch(() async {
      String title = noti.displayTitle;

      _notificationsPlugin?.show(
        noti.hashCode,
        title,
        noti.description,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel!.id,
            _channel!.name,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
          ),
        ),
        payload: jsonEncode(noti.getPayload().toJson()),
      );
    });
  }
}
