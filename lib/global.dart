import 'package:another_flushbar/flushbar_route.dart';
import 'package:evievm_app/src/config/app_nav_observer.dart';
import 'package:flutter/cupertino.dart';

class Global {
  static final globalKey = GlobalKey<NavigatorState>();
  static NavigatorState get navigator => globalKey.currentState!;
  static BuildContext get context => globalKey.currentContext!;

  static String get currentRoute => AppNavObserver.currentRoute;

  static List<OverlayEntry> overlayEntries = [];

  static const currencySymbol = 'đ';

  static void hideDialog(BuildContext dialogContext) {
    navigator.pop(dialogContext);
  }

  static void pushNamed(String routeName, {Object? args}) {
    hideAllSnackbars();
    navigator.pushNamed(routeName, arguments: args);
  }

  static void hideAllSnackbars() {
    navigator.popUntil((route) => route is! FlushbarRoute);
  }

  static void pushReplacementNamed(String routeName, {Object? args}) {
    navigator.pushReplacementNamed(routeName, arguments: args);
  }

  static void pop() {
    navigator.pop();
  }
}
