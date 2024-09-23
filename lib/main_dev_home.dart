import 'package:evievm_app/app.dart';
import 'package:evievm_app/src/config/app_config.dart';
import 'package:flutter/widgets.dart';
import 'package:here_panda_map/here_map_options.dart';
import 'package:here_panda_map/here_panda_map_pluggin.dart';
import 'package:panda_map/panda_map.dart';

void main() async {
  await configDevHome();
  await appMain();
}

Future<void> configDevHome() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PandaMap.initialize(
    plugin: HerePandaMapPluggin(
      options: HerePandaMapOptions(
        mapAPIKey: 'bb6rs_Rbb7Vz0qOXSaF_CnVL7Z3rJ53N4uJ8-fUjEM-TBSGPU6hUsWxAocMuZ1cB57oJ_v8QaXpdWEmKVCgNFg',
        mapAPIKeyId: 'GWunhRPgdFdBJcKsfrCaqg',
      ),
    ),
  );
  AppConfig.set(
    appName: 'Panda Shop Dev',
    flavorName: AppFlavor.DEV,
    apiUrl: 'https://localhost:5001',
    resourceIcon: 'https://evi-gonosen.s3.ap-northeast-1.amazonaws.com',
    logResponse: true,
    logRequest: true,
    logBloc: true,
    sinalRUrl: 'https://localhost:5001/SignalR',
  );
}
