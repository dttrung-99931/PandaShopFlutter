// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/main/main_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/screens/main_shop_screen.dart';
import 'package:evievm_app/src/features/common/presentation/screens/main_user_screen.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<MainBloc>(builder: (state) {
      if (state is! GetAppModeSuccess) {
        return emptyWidget;
      }
      // Reset to page 0 each time mode changed
      doOnBuildUICompleted(() {
        Global.mainPageIndexNotifier.value = 0;
      });
      return state.data == AppMode.shop ? const MainShopScreen() : const MainUserScreen();
    });
  }
}
