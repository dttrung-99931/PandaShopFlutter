import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/app.dart';

void main() async {
  AppConfig.set(
    appName: 'EVM Home',
    flavorName: AppFlavor.DEV,
    apiUrl: 'https://192.168.1.6:5001',
    resourceIcon: 'https://evi-gonosen.s3.ap-northeast-1.amazonaws.com',
    logResponse: true,
    logRequest: true,
    logBloc: true,
    sinalRUrl: 'https://192.168.1.6:5001/SignalR',
  );

  await appMain();
}