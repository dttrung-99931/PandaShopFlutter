import 'package:evievm_app/app.dart';
import 'package:evievm_app/src/config/app_config.dart';
import 'package:flutter/widgets.dart';

void main() async {
  await configDev();
  await setupAndRunApp();
}

Future<void> configDev() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.loadConfig(AppFlavor.dev);
}
