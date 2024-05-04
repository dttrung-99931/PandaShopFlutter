import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/app.dart';

void main() async {
  AppConfig.set(
    appName: 'EVM Staging',
    flavorName: AppFlavor.STAGING_DEV,
    apiUrl: '',
    resourceIcon: '',
    logResponse: true,
    logRequest: true,
    logBloc: true,
    sinalRUrl: '',
  );

  await appMain();
}
