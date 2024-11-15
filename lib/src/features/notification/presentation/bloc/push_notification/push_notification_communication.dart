import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/local_push_notification_dto.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/base/base_notification_receiver_bloc.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/fcm_bloc/fcm_bloc.dart';
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
        bloc.add(OnConfigNotification(notiReceiverBlocs: [
          fcmBloc,
          signalRBloc,
        ]));
      }
    });

    listenOtherBloc<LoginBloc>((state) {
      if (state is LoginSuccess) {
        fcmBloc.add(OnCreateFCMNotificationReceiver());
      }
    });

    listenOtherBloc<SignalRBloc>((state) {
      if (state is SignalRNotificationReceived) {
        bloc.add(OnPushNotification(noti: state.data));
        notiBloc.add(OnGetNotificationOverview(requestModel: GetNotificationsModel.default_()));
      }
      if (state is SinalRDriverTakeDelivery) {
        bloc.add(OnPushNotification(
          noti: LocalPushNotificationDto(
            title: 'Đơn hàng #${state.deliveryWithOrders.id} đã được nhận giao!',
            description: '',
          ),
        ));
      }
    });

    listenOtherBloc<FCMBloc>((state) {
      if (state is FCMNotificationReceived) {
        bloc.add(OnPushNotification(noti: state.data));
        notiBloc.add(OnGetNotificationOverview(requestModel: GetNotificationsModel.default_()));
      }
    });
  }

  void configNotiReceivers(OnConfigNotification event) {
    for (BaseNotificationReceiverBloc bloc in event.notiReceiverBlocs) {
      bloc.add(OnConfigNotiReceiver());
      listenOtherBloc(
        (state) {
          if (state is NotificationReceived) {
            bloc.add(OnPushNotification(noti: state.data));
            notiBloc.add(OnGetNotificationOverview(requestModel: GetNotificationsModel.default_()));
          }
        },
        bloc: bloc,
      );
    }
  }
}
