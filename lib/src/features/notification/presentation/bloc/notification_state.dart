// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'notification_bloc.dart';

class GetNotificationsSuccesss extends FullDataLoadedState<PaginatedList<NotificationDto>> {
  GetNotificationsSuccesss(super.data);
}

class GetNotificationOverviewSuccesss extends FullDataLoadedState<NotificationOverviewDto> {
  GetNotificationOverviewSuccesss(super.data);
}

class NotificationPressed extends FullDataLoadedState<PushNotificationPayload> {
  NotificationPressed(super.data);
}
