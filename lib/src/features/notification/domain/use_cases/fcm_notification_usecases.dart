import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/core/utils/mixins/disposable_mixin.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

class FCMConfigParams {
  // final
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

  Future<Either<Failure, FCMConfigResult>> config() async {
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
        logd(event.data);
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
