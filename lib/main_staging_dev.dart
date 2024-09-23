import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/app.dart';

void main() async {
  configStagingDev();
  await appMain();
}

void configStagingDev() {
  AppConfig.set(
    appName: 'Panda Shop Staging',
    flavorName: AppFlavor.STAGING_DEV,
    apiUrl: '',
    resourceIcon: '',
    logResponse: true,
    logRequest: true,
    logBloc: true,
    sinalRUrl: '',
  );
}
