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

  static void pushNamed(String routeName) {
    navigator.pushNamed(routeName);
  }

  static void pushReplacementNamed(String routeName) {
    navigator.pushReplacementNamed(routeName);
  }

  static void pop() {
    navigator.pop();
  }
}
