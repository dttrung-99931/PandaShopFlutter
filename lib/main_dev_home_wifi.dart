import 'package:evievm_app/src/config/app_config.dart';
import 'package:evievm_app/app.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/panda_map_options.dart';

void main() async {
  await configDevHomeWifi();
  await appMain();
}

Future<void> configDevHomeWifi() async {
  await PandaMap.init(
    options: MapOptions(
      mapAPIKey: 'bb6rs_Rbb7Vz0qOXSaF_CnVL7Z3rJ53N4uJ8-fUjEM-TBSGPU6hUsWxAocMuZ1cB57oJ_v8QaXpdWEmKVCgNFg',
      mapAPIKeyId: 'GWunhRPgdFdBJcKsfrCaqg',
      mapType: PandaMapType.heremap,
    ),
  );
  AppConfig.set(
    appName: 'EVM Home',
    flavorName: AppFlavor.DEV,
    apiUrl: 'https://192.168.1.31:5001',
    resourceIcon: 'https://evi-gonosen.s3.ap-northeast-1.amazonaws.com',
    logResponse: true,
    logRequest: true,
    logBloc: true,
    sinalRUrl: 'https://192.168.1.31:5001/SignalR',
  );
}
