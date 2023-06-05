import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/utils/time_utils.dart';

// Build timer widget that display time (hh, mm, ss)
class TimerBuilder extends StatelessWidget {
  final int totalSeconds;
  final Widget Function(String hours, String minutes, String seconds) builder;
  const TimerBuilder({super.key, required this.totalSeconds, required this.builder});

  @override
  Widget build(BuildContext context) {
    String hours = TimeUtils.secondsToHours(totalSeconds).toInt().toString().padLeft(2, '0');
    String minutes = TimeUtils.secondsToMinutes(totalSeconds % 3600).toInt().toString().padLeft(2, '0');
    String seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return builder(hours, minutes, seconds);
  }
}
