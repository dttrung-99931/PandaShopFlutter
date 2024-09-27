import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:flutter/widgets.dart';

class Constants {
  static const switchTabAnimDuration = Duration(milliseconds: 150);
  // Pagination
  static const int startPageNum = 1;
  static const int defaultPageSize = 20;

  static const int noLimit = -1;
  static const int idEmpty = -1;
  static const String codeEmpty = 'empty';
  static final Duration defaultAPICacheTime = 5.minutes;
}

const emptyWidget = SizedBox.shrink();
