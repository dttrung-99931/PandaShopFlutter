import 'package:evievm_app/src/config/app_router.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppNavObserver extends NavigatorObserver {
  static String _currentRoute = AppRouter.initialRouter;
  static String get currentRoute => _currentRoute;

  final Map<String, Function()> disposeMap = {
    HomeScreen.router: () {
      // getIt.resetLazySingleton<StoredPhotoBloc>();
    }
  };

  @override
  void didPop(Route route, Route? previousRoute) {
    disposeMap[route.settings.name]?.call();
    if (previousRoute != null) {
      _setCurrentRoute(previousRoute);
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _setCurrentRoute(route);
    super.didPush(route, previousRoute);
  }

  void _setCurrentRoute(Route<dynamic> route) {
    if (route.settings.name != null) {
      _currentRoute = route.settings.name!;
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (newRoute != null) {
      disposeMap[newRoute.settings.name]?.call();
      _setCurrentRoute(newRoute);
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    disposeMap[route.settings.name]?.call();
    if (previousRoute != null) {
      _setCurrentRoute(previousRoute);
    }
    super.didRemove(route, previousRoute);
  }
}
