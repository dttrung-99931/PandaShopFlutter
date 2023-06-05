import 'package:easy_localization/easy_localization.dart';

import '../utils/log.dart';
import 'map_message.dart';

class Failure {
  String msg;
  String displayMsg;

  Failure([this.msg = 'no failure message']) : displayMsg = (mapMessage[msg] ?? msg).tr();

  void log() {
    loge('  Error');
    loge('    $runtimeType $msg');

    // Log calling method
    List<String> stackTraces = StackTrace.current.toString().split('\n');
    loge('    ${stackTraces[1]}');
  }
}

class NetworkFailure extends Failure {
  NetworkFailure([String? msg]) : super(msg = msg ?? 'messages.network_error'.tr());
}

class ServerError extends Failure {
  final Map<String, dynamic>? errors;
  ServerError([String msg = 'server error', this.errors]) : super(msg);
}

// unexpected error
class UnexpectedFailure extends Failure {
  UnexpectedFailure() : super('UnexpectedFailure');
}
// class UnExcepected extends Failure {}
