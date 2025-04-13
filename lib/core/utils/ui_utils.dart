import 'package:flutter/services.dart';

enum UIMode {
  // App showing with staus bar and navigation bar
  normal,
  // App showing in full screen
  fullScreen,
}

class UIUtils {
  static Future<void> changeUIMode(UIMode mode) async {
    switch (mode) {
      case UIMode.fullScreen:
        await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        break;
      case UIMode.normal:
        await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
          SystemUiOverlay.top,
          SystemUiOverlay.bottom,
        ]);
        break;
    }
  }
}
