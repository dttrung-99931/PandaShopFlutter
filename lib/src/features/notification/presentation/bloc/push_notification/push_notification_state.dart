// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'push_notification_bloc.dart';

class NotificationReceived extends FullDataLoadedState<RemotePushNotificationDto> {
  NotificationReceived(super.data);
}

class ConfigPushNotificationComplete extends LoadingCompleteStateWithoutProps {}

class PushNotificationPressed extends FullDataLoadedState<RemotePushNotificationPayload> {
  PushNotificationPressed(super.data);
}
