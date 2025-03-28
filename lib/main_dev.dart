import 'package:evievm_app/app.dart';
import 'package:evievm_app/src/config/app_config.dart';
import 'package:flutter/widgets.dart';

void main() async {
  await configDev();
  await appMain();
}

Future<void> configDev() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.set(
    appName: 'Panda Shop Dev',
    flavorName: AppFlavor.DEV,
    apiUrl: 'http://localhost:44444',
    resourceIcon: 'https://evi-gonosen.s3.ap-northeast-1.amazonaws.com',
    logResponse: true,
    logRequest: true,
    logBloc: true,
    sinalRUrl: 'http://localhost:44444/SignalR',
    hereMapAPIKey: 'yourMapAPIKey',
    hereMapAPIKeyId: 'yourMapAPIKeyId',
  );
}
