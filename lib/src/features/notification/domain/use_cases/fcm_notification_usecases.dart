import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FCMNotificationsUseCases {
  FCMNotificationsUseCases();

  Future<Either<Failure, String?>> getFcmNotificationToken() async {
    return executeWithTryCatch(() async {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? token = await messaging.getToken();
      return token;
    });
  }
}
