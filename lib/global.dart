import 'package:another_flushbar/flushbar_route.dart';
import 'package:evievm_app/src/config/app_nav_observer.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/shop_response_dto.dart';
import 'package:flutter/material.dart';

import 'src/features/common/domain/dtos/user_detail_dto.dart';
import 'src/features/main/presentation/blocs/main/main_bloc.dart';

class Global {
  static final globalKey = GlobalKey<NavigatorState>();
  static NavigatorState get navigator => globalKey.currentState!;
  static BuildContext get context => globalKey.currentContext!;

  static String get currentRoute => AppNavObserver.currentRoute;

  static List<OverlayEntry> overlayEntries = [];

  static const currencySymbol = 'đ';

  static ShopDto? get shop => _userDetail?.shop;
  static UserDetailDto? _userDetail;
  static UserDetailDto? get userDetail => _userDetail;
  static bool get userDataLoaded => _userDetail != null;
  static void setUserDetail(UserDetailDto detail) {
    _userDetail = detail;
  }

  static AppMode? appMode;
  static bool get isUserMode {
    return appMode == null || appMode == AppMode.user;
  }

  static ValueNotifier<int> mainPageIndexNotifier = ValueNotifier(0);

  static void hideDialog(BuildContext dialogContext) {
    navigator.pop(dialogContext);
  }

  static Future<T?> pushNamed<T extends Object?>(String routeName, {Object? args}) {
    hideAllSnackbars();
    return navigator.pushNamed(routeName, arguments: args);
  }

  static Future<T?> popAllAndPushNamed<T extends Object?>(String routeName) {
    hideAllSnackbars();
    return navigator.pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  static void popUntilNamed<T extends Object?>(String routeName) {
    navigator.popUntil(ModalRoute.withName(routeName));
  }

  // TODO: fix, currently not working
  // static void popAllCurrentDialogs<T extends Object?>() {
  //   navigator.popUntil((route) => route is MaterialPageRoute);
  // }

  static void hideAllSnackbars() {
    navigator.popUntil((route) => route is! FlushbarRoute);
  }

  static void pushReplacementNamed(String routeName, {Object? args}) {
    navigator.pushReplacementNamed(routeName, arguments: args);
  }

  static void pop<T>([T? result]) {
    navigator.pop(result);
  }

  static Future<T?> swapCurrentAndPrevRoute<T extends Object?>({
    // Map<route name, udpated args>
    Map<String, dynamic> updatedArgs = const {},
  }) async {
    if (AppNavObserver.previousRoute != null) {
      String currentRoute = AppNavObserver.currentRoute;
      String previousRoute = AppNavObserver.previousRoute!;
      Object? currentRouteArgs = updatedArgs[currentRoute] ?? AppNavObserver.currentRouteArgs;
      Object? previousRouteArgs = updatedArgs[previousRoute] ?? AppNavObserver.previousRouteArgs;
      pop();
      pop();
      pushNamed(currentRoute, args: currentRouteArgs);
      return pushNamed(previousRoute, args: previousRouteArgs);
    }
    return null;
  }

  // like pushNamed and make sure unique screen existing in stack when one of two screens go to each other many times
  static Future<T?> pushNamedSafe<T extends Object?>(String routeName, {Object? args, bool showCommingSoon = true}) {
    if (AppNavObserver.previousRoute != routeName) {
      return Global.pushNamed(routeName, args: args);
    } else {
      return Global.swapCurrentAndPrevRoute(updatedArgs: {
        routeName: args,
      });
    }
  }

  static void hideAllDialogs({List<String> ignoreDialogRoutes = const []}) {
    Global.navigator.popUntil((route) =>
        (route is! DialogRoute || ignoreDialogRoutes.contains(route.settings.name)) || (!Global.navigator.canPop()));
  }
}
