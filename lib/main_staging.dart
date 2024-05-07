import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/app.dart';

void main() async {
  configStaging();
  await appMain();
}

void configStaging() {
  AppConfig.set(
    appName: 'EVM Staging',
    flavorName: AppFlavor.STAGING,
    apiUrl: '',
    resourceIcon: '',
    logResponse: false,
    logRequest: false,
    logBloc: false,
    sinalRUrl: '',
  );
}
