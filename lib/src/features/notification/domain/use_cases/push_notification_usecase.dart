import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification_dto.dart';
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
      notificationsPlugin!.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(), // TODO:
        ),
      );
    });
  }

  Future<Either<Failure, dynamic>> pushNoti(PushNotificationDto param) async {
    if (notificationsPlugin == null) {
      return Left(Failure('Notificaiton plugin is not initialized'));
    }
    return executeWithTryCatch(() async {
      String title = param.title;

      notificationsPlugin?.show(
        param.hashCode,
        title,
        param.description,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel!.id,
            channel!.name,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
          ),
        ),
      );
    });
  }
}
