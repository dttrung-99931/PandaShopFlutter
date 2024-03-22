import 'package:another_flushbar/flushbar_route.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/app_router.dart';
import 'package:evievm_app/src/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppNavObserver extends NavigatorObserver {
  static String _currentRoute = AppRouter.initialRouter;
  static String get currentRoute => _currentRoute;
  static Object? get currentRouteArgs => _routeArgsStack.atOrNull(_routeArgsStack.length - 1);

  static final List<String> _routeStack = [];
  static final List<Object?> _routeArgsStack = [];
  static String? get previousRoute => _routeStack.atOrNull(_routeStack.length - 2);
  static Object? get previousRouteArgs => _routeArgsStack.atOrNull(_routeArgsStack.length - 2);

  final Map<String, Function()> disposeMap = {};

  // Handle sth when new screen is pushed
  final Map<String, Function()> preRouteHanlderMap = {};

  final Map<String, Function()> reloadWhenCommeBackHanlderMap = {};

  @override
  void didPop(Route route, Route? previousRoute) {
    _removeRoute(route);
    disposeMap[route.settings.name]?.call();
    if (previousRoute != null) {
      _setCurrentRoute(previousRoute);
      if (route is! FlushbarRoute) {
        reloadWhenCommeBackHanlderMap[previousRoute.settings.name]?.call();
      }
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _addRoute(route);
    _setCurrentRoute(route);
    preRouteHanlderMap[route.settings.name]?.call();
    super.didPush(route, previousRoute);
  }

  void _setCurrentRoute(Route<dynamic> route) {
    if (route.settings.name != null) {
      _currentRoute = route.settings.name!;
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _removeRoute(oldRoute);
    _addRoute(newRoute);
    if (newRoute != null) {
      _setCurrentRoute(newRoute);
    }
    if (oldRoute != null) {
      disposeMap[oldRoute.settings.name]?.call();
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _removeRoute(route);
    disposeMap[route.settings.name]?.call();
    if (previousRoute != null) {
      _setCurrentRoute(previousRoute);
    }
    super.didRemove(route, previousRoute);
  }

  void _addRoute(Route? route) {
    if (route == null) return;
    if (route.settings.name == null) return;
    _routeStack.add(route.settings.name!);
    _routeArgsStack.add(route.settings.arguments);
  }

  void _removeRoute(Route? route) {
    if (route == null) return;
    if (route.settings.name == null) return;
    _routeStack.remove(route.settings.name!);
    _routeArgsStack.remove(route.settings.arguments);
  }

  static bool isExistRoute(String routeName) {
    return _routeStack.contains(routeName);
  }
}
