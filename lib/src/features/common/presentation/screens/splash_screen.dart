import 'dart:math';

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/screens/main_screen.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/shop_product_detail_screen.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          Global.navigator.pushReplacementNamed(
            ShopProductDetailScreen.router,
            arguments: ShopProductDetailScreenArgs(),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary.withOpacity(.8),
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(height: 100.h, Assets.img.splash),
          ),
        ),
      ),
    );
  }
}
