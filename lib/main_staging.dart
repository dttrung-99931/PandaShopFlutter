import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/app.dart';
import 'package:flutter/widgets.dart';

void main() async {
  await configStaging();
  await appMain();
}

Future<void> configStaging() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.loadConfig(AppFlavor.staging);
}
