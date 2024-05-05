// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/main/main_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/screens/main_shop_screen.dart';
import 'package:evievm_app/src/features/common/presentation/screens/main_user_screen.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_bloc.dart';
import 'package:evievm_app/src/features/notification/presentation/screens/widgets/notification_pressed_listener.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const router = '/main';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    mainBloc.add(OnGetAppMode());
    getIt<PushNotificationBloc>(); // Get to create pusn noti bloc
  }

  @override
  Widget build(BuildContext context) {
    return NotificationPressedListener(
      child: CustomBlocConsumer<MainBloc>(listener: (state) {
        if (state is GetAppModeSuccess) {
          AppTheme.of(context).updateTheme();
        }
      }, builder: (state) {
        if (state is! GetAppModeSuccess) {
          return emptyWidget;
        }
        return state.data == AppMode.shop ? const MainShopScreen() : const MainUserScreen();
      }),
    );
  }
}
