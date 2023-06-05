import 'dart:async';

import 'package:flutter/foundation.dart';

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
    required String socketUrl,
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
    _config!.socketUrl = socketUrl;

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
  late final String socketUrl;

  bool get isDevelopment => flavorName == AppFlavor.DEV || flavorName == AppFlavor.STAGING_DEV;

  bool get isDevelopmentDebug => isDevelopment && kDebugMode;
}

// ignore: constant_identifier_names
enum AppFlavor { DEV, STAGING_DEV, STAGING, PRODUCTION }
