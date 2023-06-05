import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtils {
  static Future<bool> get isConnected async => (await Connectivity().checkConnectivity()) != ConnectivityResult.none;
}
