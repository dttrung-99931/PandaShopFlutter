import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/app.dart';

void main() async {
  AppConfig.set(
    appName: 'EVM Dev',
    flavorName: AppFlavor.DEV,
    apiUrl: 'http://localhost:44444',
    resourceIcon: 'https://evi-gonosen.s3.ap-northeast-1.amazonaws.com',
    logResponse: true,
    logRequest: true,
    logBloc: true,
    sinalRUrl: 'http://localhost:44444/SignalR',
  );

  await appMain();
}
