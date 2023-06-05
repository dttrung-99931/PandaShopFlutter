import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/app.dart';

void main() async {
  AppConfig.set(
    appName: 'EVM',
    flavorName: AppFlavor.PRODUCTION,
    apiUrl: '',
    resourceIcon: '',
    logResponse: false,
    logRequest: false,
    logBloc: false,
    socketUrl: '',
  );

  await appMain();
}
