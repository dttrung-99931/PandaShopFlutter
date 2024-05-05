// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'push_notification_bloc.dart';

class OnConfigPushNotification extends BaseEventWithoutProps {}

class OnPushNotification extends BaseEvent {
  final PushNotificationDto noti;
  OnPushNotification({
    required this.noti,
  });
  @override
  List<Object?> get props => [noti];
}

class OnCreateFCMNotificationReceiver extends BaseEventWithoutProps {}
