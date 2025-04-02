import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/main/presentation/screens/main_screen.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  static const router = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomBlocListener<LoginBloc>(
      initialEvent: OnCheckLogin(),
      listener: (state) async {
        if (state is CheckLoginSuccess) {
          Global.navigator.pushReplacementNamed(MainScreen.router);
          // Remove splash when app started
          await Future.delayed(100.milliseconds);
          FlutterNativeSplash.remove();
        }
      },
      child: const Scaffold(
        backgroundColor: AppColors.transparent,
      ),
    );
  }
}
