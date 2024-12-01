import 'package:evievm_app/app.dart';
import 'package:evievm_app/src/config/app_config.dart';
import 'package:flutter/widgets.dart';

void main() async {
  await configDevHome();
  await appMain();
}

Future<void> configDevHome() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.set(
    appName: 'Panda Shop Dev',
    flavorName: AppFlavor.DEV,
    apiUrl: 'https://localhost:5001',
    resourceIcon: 'https://evi-gonosen.s3.ap-northeast-1.amazonaws.com',
    logResponse: true,
    logRequest: true,
    logBloc: true,
    sinalRUrl: 'https://localhost:5001/SignalR',
    hereMapAPIKey: 'yourMapAPIKey',
    hereMapAPIKeyId: 'yourMapAPIKeyId',
  );
}
