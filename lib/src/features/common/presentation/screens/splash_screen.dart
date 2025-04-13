import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/main/presentation/blocs/main/main_bloc.dart';
import 'package:evievm_app/src/features/main/presentation/screens/main_screen.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  static const router = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    mainBloc.add(OnGetAppMode());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlocListener<LoginBloc>(
      listener: (state) async {
        if (state is CheckLoginSuccess) {
          Global.navigator.pushReplacementNamed(MainScreen.router);
          await Future.delayed(100.milliseconds);
        }
      },
    );
  }
}
