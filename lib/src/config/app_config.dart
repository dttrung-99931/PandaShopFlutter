import 'dart:async';

import 'package:evievm_app/main.dart';
import 'package:evievm_app/main_dev.dart';
import 'package:evievm_app/main_staging.dart';
import 'package:evievm_app/main_staging_dev.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppConfig {
  static AppConfig? _config;

  static AppConfig get config {
    if (_config == null) throw Exception('AppConfig not set');
    return _config!;
  }

  AppConfig._();

  static AppConfig set({
    required String appName,
    required AppFlavor flavorName,
    required String apiUrl,
    required String resourceIcon,
    required bool logResponse,
    required bool logRequest,
    required bool logBloc,
    required String sinalRUrl,
    bool logCurl = false,
  }) {
    _config ??= AppConfig._();
    _config!.appName = appName;
    _config!.flavorName = flavorName;
    _config!.apiUrl = apiUrl;
    _config!.resourceIcon = resourceIcon;
    _config!.logResponse = logResponse;
    _config!.logRequest = logRequest;
    _config!.logBloc = logBloc;
    _config!.logCurl = logCurl;
    _config!.sinalRUrl = sinalRUrl;

    FlutterError.onError = (FlutterErrorDetails details) {
      if (_config!.isDevelopment) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception, details.stack ?? StackTrace.fromString("stackTraceString"));
      }
    };

    return _config!;
  }

  late final String appName;
  late final AppFlavor flavorName;
  late final String apiUrl;
  late final String resourceIcon;
  late final bool logResponse;
  late final bool logRequest;
  late final bool logCurl;
  late final bool logBloc;
  late final String sinalRUrl;

  bool get isDevelopment => flavorName == AppFlavor.DEV || flavorName == AppFlavor.STAGING_DEV;

  bool get isDevelopmentDebug => isDevelopment && kDebugMode;

  static Map<AppFlavor, Function()> configurerMap = {
    AppFlavor.DEV: configDev,
    AppFlavor.STAGING: configStaging,
    AppFlavor.PRODUCTION: configProduction,
    AppFlavor.STAGING_DEV: configStagingDev,
  };
  static Future<void> autoConfigByBundleId() async {
    AppFlavor env = await getFlavorByCurrentAppBundleId();
    await configurerMap[env]?.call();
  }

  static Future<AppFlavor> getFlavorByCurrentAppBundleId() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    String bundleId = info.packageName;
    if (bundleId.toLowerCase().contains('dev')) {
      return AppFlavor.DEV;
    }
    if (bundleId.toLowerCase().contains('staging')) {
      return AppFlavor.STAGING;
    }
    if (bundleId.toLowerCase().contains('staging_dev')) {
      return AppFlavor.STAGING_DEV;
    }
    return AppFlavor.PRODUCTION;
  }

  // Flavor need match with bundle id like below role
  // to make background notificaiton working correctly in
  Future<void> validateFlavorMatchingBundleId() async {
    assert(
      flavorName == await getFlavorByCurrentAppBundleId(),
      """Native bundle id must contains match env name. 
      Ex: dev bundle id mus contains 'dev' => dev bundle id may be 'app.test.dev'""",
    );
  }
}

// ignore: constant_identifier_names
enum AppFlavor { DEV, STAGING_DEV, STAGING, PRODUCTION }
