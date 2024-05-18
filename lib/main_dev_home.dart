import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/app.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/panda_map_options.dart';

void main() async {
  await configDevHome();
  await appMain();
}

Future<void> configDevHome() async {
  await PandaMap.init(
    options: const MapOptions(mapAPIKey: '', mapType: PandaMapType.google),
  );
  AppConfig.set(
    appName: 'EVM Home',
    flavorName: AppFlavor.DEV,
    apiUrl: 'https://localhost:5001',
    resourceIcon: 'https://evi-gonosen.s3.ap-northeast-1.amazonaws.com',
    logResponse: true,
    logRequest: true,
    logBloc: true,
    sinalRUrl: 'https://localhost:5001/SignalR',
  );
}
