import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_bloc.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/signalr_bloc/signalr_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PushNotificationCommunication extends BlocCommunication<PushNotificationBloc> {
  @override
  void startCommunication(PushNotificationBloc bloc) {
    super.startCommunication(bloc);
    listenOtherBloc<UserBloc>((state) {
      if (state is GetUserDetailSuccess) {
        bloc.add(OnConfigPushNotification());
      }
    });

    listenOtherBloc<SignalRBloc>((state) {
      if (state is SignalRNotificationReceived) {
        bloc.add(OnPushNotification(noti: state.data));
        notiBloc.add(OnGetNotificationOverview(requestModel: GetNotificationsModel.default_()));
      }
    });
  }

  void config() {
    signalRBloc.add(OnConfigSingalR());
  }
}