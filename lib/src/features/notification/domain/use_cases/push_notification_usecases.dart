import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/main/main_bloc.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_payload.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_dto.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PushNotificationUseCases {
  PushNotificationUseCases();
  FlutterLocalNotificationsPlugin? notificationsPlugin;
  AndroidNotificationChannel? channel;

  Future<Either<Failure, dynamic>> config() async {
    if (notificationsPlugin != null) {
      return const Right('Local noti was configured');
    }
    return executeWithTryCatch(() async {
      notificationsPlugin = FlutterLocalNotificationsPlugin();
      if (Platform.isAndroid) {
        channel = const AndroidNotificationChannel(
          'high_importance_channel',
          'High Importance Notifications',
          importance: Importance.max,
        );
        await notificationsPlugin
            ?.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(channel!);
      } else if (Platform.isIOS) {
        await notificationsPlugin
            ?.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            );
      }
      // notificationsPlugin!.
      notificationsPlugin!.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(), // TODO:
        ),
        onDidReceiveNotificationResponse: (NotificationResponse details) {
          if (details.payload == null) {
            logd('Invalid notificaiton without payload');
            return;
          }
          switch (details.notificationResponseType) {
            case NotificationResponseType.selectedNotification:
              PushNotificationPayload payload = PushNotificationPayload.fromJson(jsonDecode(details.payload!));
              notiBloc.add(OnSetState(NotificationPressed(payload)));

              break;
            case NotificationResponseType.selectedNotificationAction:
              logd('selectedNotificationAction');
              // TODO:
              // if (details.actionId == navigationActionId) {
              //   selectNotificationStream.add(details.payload);
              // }
              break;
          }
        },
      );
    });
  }

  Future<Either<Failure, dynamic>> pushNoti(PushNotificationDto noti) async {
    if (notificationsPlugin == null) {
      return Left(Failure('Notificaiton plugin is not initialized'));
    }
    return executeWithTryCatch(() async {
      String title = noti.displayTitle;

      notificationsPlugin?.show(
        noti.hashCode,
        title,
        noti.description,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel!.id,
            channel!.name,
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
