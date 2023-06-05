import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/app_config.dart';
import 'package:flutter/material.dart';

final emptyConditions = ['', 0, []];
bool isNullOrEmpty(dynamic obj) {
  return obj == null || emptyConditions.contains(obj);
}

disableFocus() async {
  if (Global.overlayEntries.isNotEmpty) {
    Global.overlayEntries.removeLast().remove();
  }
  FocusManager.instance.primaryFocus?.unfocus();
}

Future delay(Duration duration) async {
  await Future.delayed(duration);
}

bool isNumeric(String str) {
  try {
    double.parse(str);
    return true;
  } catch (e) {
    return false;
  }
}

Future delayMilis(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

Color? hexToColor(String? code) {
  if (code == null) return null;
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class Utils {
  static int getTotalPages(int total, int pageSize) {
    return total ~/ pageSize + (total % pageSize == 0 ? 0 : 1);
  }

  static String? getIconUrl(String? icon) {
    if (icon == null) return null;
    String domain = AppConfig.config.resourceIcon;
    if (domain.endsWith('/')) {
      domain = domain.substring(0, domain.length - 1);
    }
    if (icon.startsWith('/')) {
      icon = icon.substring(1);
    }
    return '$domain/$icon';
  }
}
