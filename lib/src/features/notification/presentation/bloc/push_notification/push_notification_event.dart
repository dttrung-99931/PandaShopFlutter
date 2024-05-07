// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'push_notification_bloc.dart';

class OnConfigNotification extends BaseEvent {
  // List of notification receiver blocs that used to receive notifications
  final List<BaseNotificationReceiverBloc> notiReceiverBlocs;
  OnConfigNotification({
    required this.notiReceiverBlocs,
  });
  @override
  List<Object?> get props => [notiReceiverBlocs];
}

class OnReceivedNotification extends BaseEvent {
  final Map<String, dynamic> notiData;

  OnReceivedNotification.fromNotiDataJson({
    required this.notiData,
  });

  OnReceivedNotification.fromNotiDataJsonString(String jsonString) : notiData = jsonDecode(jsonString);

  @override
  List<Object?> get props => [notiData];
}

class OnPushNotification extends BaseEvent {
  final PushNotificationDto noti;
  OnPushNotification({
    required this.noti,
  });
  @override
  List<Object?> get props => [noti];
}

class OnConfigNotiReceiver extends BaseEventWithoutProps {}
