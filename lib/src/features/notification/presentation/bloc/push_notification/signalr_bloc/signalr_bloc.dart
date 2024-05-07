// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/core/utils/storage.dart';
import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_dto.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/base/base_notification_receiver_bloc.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:signalr_netcore/signalr_client.dart';

part 'signalr_event.dart';
part 'signalr_state.dart';

SignalRBloc get signalRBloc => getIt<SignalRBloc>();

@lazySingleton
class SignalRBloc extends BaseNotificationReceiverBloc {
  SignalRBloc(this._storage) : super(InitialState());

  static const onNotificationEvent = 'onNotification';
  final Storage _storage;
  HubConnection? _hub;

  @override
  FutureOr<void> onConfig(OnConfigNotiReceiver event, Emitter<BaseState> emit) async {
    await _hub?.stop();

    _hub = HubConnectionBuilder()
        .withUrl(
          AppConfig.config.sinalRUrl,
          options: HttpConnectionOptions(
            accessTokenFactory: () async => _storage.token!,
            transport: HttpTransportType.WebSockets,
            skipNegotiation: true,
          ),
        )
        .withAutomaticReconnect()
        .build();
    _hub!.onclose(_onSingalRDisconnected);
    _hub!.on(onNotificationEvent, _onNotification);
    _hub!.start();
  }

  void _onNotification(List<Object?>? arguments) {
    if (arguments == null || arguments.isEmpty) {
      logd('Invalid signalr notification $arguments');
      return;
    }
    add(OnReceivedNotification.fromNotiDataJsonString(
      arguments.first.toString(),
    ));
  }

  void _onSingalRDisconnected({error}) {
    logd('SignalR connection closed');
  }

  @override
  NotificationReceived buildNotificationReceiverState(PushNotificationDto noti) {
    return SignalRNotificationReceived(noti);
  }
}
