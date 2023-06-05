import 'dart:math';

import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/email_login_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/qr_barcode_reader_login_screen.dart';
import 'package:evievm_app/src/features/top/presentation/screens/top_screen.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/time_utils.dart';
// import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  static const router = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int _showingSplashMilis = 1200;
  final DateTime _start = now;

  int get delayedShowingMilis {
    return max(_showingSplashMilis - now.difference(_start).inMilliseconds, 0);
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlocListener<LoginBloc>(
      initialEvent: OnCheckLogin(),
      listener: (state) async {
        if (state is CheckLoginSuccess) {
          await delayMilis(delayedShowingMilis);
          Global.navigator.pushReplacementNamed(TopScreen.router);
        }
      },
      child: Scaffold(
        backgroundColor: EVMColors.primary,
        body: Center(
          child: SvgPicture.asset(height: 132.h, Assets.img.evmLogo, color: EVMColors.white),
          // TODO: Create animated splash like the below (from Evinote)
          // child: SizedBox(
          //   width: 300,
          //   height: 300,
          //   child: RiveAnimation.asset(
          //     Assets.riv.splashLogo,
          //     alignment: Alignment.center,
          //     controllers: [_controller],
          //     // onInit: (_) => setState(() {}),
          //   ),
          // ),
        ),
      ),
    );
  }
}
