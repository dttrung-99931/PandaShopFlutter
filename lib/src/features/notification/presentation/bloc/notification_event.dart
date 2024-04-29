// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notification_bloc.dart';

class OnGetNotifications extends BaseEvent {
  final GetNotificationsModel requestModel;
  OnGetNotifications({
    required this.requestModel,
  });

  @override
  List<Object?> get props => [requestModel];
}
