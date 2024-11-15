import 'package:evievm_app/src/features/notification/data/models/response/push_notification/local_push_notification_payload.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_payload.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/remote_push_notification_payload.dart';

class PushNotificationPayloadFactory {
  static PushNotificationPayload fromJson(Map<String, dynamic> payloadJson) {
    final type = payloadJson['type'];
    if (type == '$RemotePushNotificationPayload') {
      return RemotePushNotificationPayload.fromJson(payloadJson);
    }
    if (type == '$LocalPushNotificationPayload') {
      return LocalPushNotificationPayload.fromJson(payloadJson);
    }
    throw 'Invalid push noti payload type $type';
  }

  static Map<String, dynamic> toJson<T extends PushNotificationPayload>(T payload) {
    return {
      'type': '$T',
      'payload': payload.toJson(),
    };
  }
}
