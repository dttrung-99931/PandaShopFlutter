import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/app.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/panda_map_options.dart';

void main() async {
  await configDev();
  await appMain();
}

Future<void> configDev() async {
  await PandaMap.init(
    options: MapOptions(mapAPIKey: 'AIzaSyALbPC2ZoNXKr_OTXLxD_wY-348rPXwDw4', mapType: PandaMapType.google,),
  );
  AppConfig.set(
    appName: 'EVM Dev',
    flavorName: AppFlavor.DEV,
    apiUrl: 'http://localhost:44444',
    resourceIcon: 'https://evi-gonosen.s3.ap-northeast-1.amazonaws.com',
    logResponse: true,
    logRequest: true,
    logBloc: true,
    sinalRUrl: 'http://localhost:44444/SignalR',
  );
}
