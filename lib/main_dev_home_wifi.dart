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
    apiUrl: 'https://192.168.1.31:5001',
    resourceIcon: 'https://evi-gonosen.s3.ap-northeast-1.amazonaws.com',
    logResponse: true,
    logRequest: true,
    logBloc: true,
    sinalRUrl: 'https://localhost:5001/SignalR',
    hereMapAPIKey: 'bb6rs_Rbb7Vz0qOXSaF_CnVL7Z3rJ53N4uJ8-fUjEM-TBSGPU6hUsWxAocMuZ1cB57oJ_v8QaXpdWEmKVCgNFg',
    hereMapAPIKeyId: 'GWunhRPgdFdBJcKsfrCaqg',
  );
}
