import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/app.dart';
import 'package:flutter/widgets.dart';

void main() async {
  configProduction();
  await appMain();
}

void configProduction() {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: config PandaMap
  AppConfig.set(
    appName: 'EVM',
    flavorName: AppFlavor.PRODUCTION,
    apiUrl: '',
    resourceIcon: '',
    logResponse: false,
    logRequest: false,
    logBloc: false,
    sinalRUrl: '',
  );
}
