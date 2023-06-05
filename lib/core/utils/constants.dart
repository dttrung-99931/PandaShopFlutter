import 'time_utils.dart';

class Constatnts {
  static final DateTime todayDateTime = DateTime(now.year, now.month, now.day);
  // 8am of today
  static final DateTime startWokringTime = todayDateTime.add(const Duration(hours: 9));
  // 18pm of today
  static final DateTime endWokringTime = todayDateTime.add(const Duration(hours: 18));
  static final totalMilisWorkingTimeADay =
      endWokringTime.millisecondsSinceEpoch - startWokringTime.millisecondsSinceEpoch;
  static const int minDoingTimeInSec = 45;

  //
  static const switchTabAnimDuration = Duration(milliseconds: 150);

  static const int noLimit = -1;
}
