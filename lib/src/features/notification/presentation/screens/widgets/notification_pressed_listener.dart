// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/common/presentation/screens/main_screen.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/remote_push_notification_payload.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_bloc.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:flutter/material.dart';

class NotificationPressedListener extends StatelessWidget {
  const NotificationPressedListener({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomBlocListener<PushNotificationBloc>(
      listener: (state) {
        if (state is! PushNotificationPressed) {
          return;
        }
        RemotePushNotificationPayload payload = state.data;
        switch (payload.notiType) {
          case NotificationType.userOrderNoti:
            _handleUserNotiPressed(payload);
            break;
          case NotificationType.shopOrderNoti:
            _handleShopNotiPressed(payload);
            break;
          case NotificationType.ads:
            _handleAdsNotiPressed(payload);
            break;
        }
      },
      child: child,
    );
  }

  void _handleShopNotiPressed(RemotePushNotificationPayload payload) {
    if (payload.orderId != null) {
      Global.navigator.popUntil(ModalRoute.withName(MainScreen.router));
      Global.mainPageIndexNotifier.value = 1;
      shopOrderBloc.add(OnSelectOrderStatus(selected: OrderStatus.created));
    }
  }

  void _handleUserNotiPressed(RemotePushNotificationPayload payload) {
    // TODO:
  }
  void _handleAdsNotiPressed(RemotePushNotificationPayload payload) {
    // TODO:
  }
}
