import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/app_bloc_observer.dart';
import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/src/config/app_nav_observer.dart';
import 'package:evievm_app/src/config/app_router.dart';
import 'package:evievm_app/src/config/app_translation.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/firebase_config.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> appMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.config.validateFlavorMatchingBundleId();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  configureDependencies();
  HttpOverrides.global = PandaHttpOverrides();
  FirebaseConfig.config();
  runApp(EasyLocalization(
    supportedLocales: AppTranslation.supportedLocales,
    path: AppTranslation.path,
    fallbackLocale: AppTranslation.ja,
    startLocale: AppTranslation.ja,
    child: const PandaShopApp(),
  ));
}

class PandaShopApp extends StatelessWidget {
  const PandaShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppConfig.config.logBloc) {
      Bloc.observer = AppBlocObserver();
    }

    return GestureDetector(
      onTap: removeCurrentFocus,
      child: ScreenUtilInit(
        designSize: const Size(540, 960),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return AppThemeWidget(
            builder: (themeContext) => MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              navigatorKey: Global.globalKey,
              debugShowCheckedModeBanner: false,
              title: AppConfig.config.appName,
              onGenerateRoute: AppRouter.onGenerateRoute,
              theme: AppTheme.themeOf(themeContext),
              initialRoute: AppRouter.initialRouter,
              navigatorObservers: [AppNavObserver()],
            ),
          );
        },
      ),
    );
  }
}

// To fix CERTIFICATE_VERIFY_FAILED error
class PandaHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
