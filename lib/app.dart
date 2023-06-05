import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/app_bloc_observer.dart';
import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/src/config/app_nav_observer.dart';
import 'package:evievm_app/src/config/app_router.dart';
import 'package:evievm_app/src/config/app_translation.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> appMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  configureDependencies();

  runApp(EasyLocalization(
    supportedLocales: AppTranslation.supportedLocales,
    path: AppTranslation.path,
    fallbackLocale: AppTranslation.ja,
    startLocale: AppTranslation.ja,
    child: const EvmApp(),
  ));
}

class EvmApp extends StatelessWidget {
  const EvmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppConfig.config.logBloc) {
      Bloc.observer = AppBlocObserver();
    }

    return GestureDetector(
      onTap: disableFocus,
      child: ScreenUtilInit(
        designSize: const Size(1280, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (ctx, child) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          navigatorKey: Global.globalKey,
          debugShowCheckedModeBanner: false,
          title: AppConfig.config.appName,
          onGenerateRoute: AppRouter.onGenerateRoute,
          theme: theme(context),
          initialRoute: AppRouter.initialRouter,
          navigatorObservers: [AppNavObserver()],
        ),
      ),
    );
  }
}
