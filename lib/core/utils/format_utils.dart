import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatUtils {
  static const formatJpDate = 'y年M月d日(E)';

  static final NumberFormat currencyFormmater = NumberFormat('#,###');
  static String formatMoney(double money) {
    // if (money.toStringAsFixed(0).length > 6) {
    //   // TODO: Return text number for long price like '20tr300'
    //   return 'Giá dài';
    // }
    return currencyFormmater.format(money);
  }

  static String formatDate(DateTime date, {String format = 'yyyy/MM/dd', String? locale}) {
    return DateFormat(format, locale).format(date);
  }

  static String formatTime(DateTime time, {String format = 'HH:mm'}) {
    return DateFormat(format).format(time);
  }

  static String formatDateTime(DateTime dateTime, {String format = 'yyyy/MM/d(E) HH:mm'}) {
    return DateFormat(format, 'ja-JP').format(dateTime);
  }

  static String formatTimeOfDay(TimeOfDay time, {String format = 'HH:mm'}) {
    return formatTime(DateTime(0, 0, 0, time.hour, time.minute, 0), format: format);
  }

  static String? formatTimeOfDayServer(TimeOfDay? time) {
    if (time == null) return null;
    return formatTimeOfDay(time, format: 'HH:mm:ss');
  }
}
