import 'package:evievm_app/global.dart';
import 'package:flutter/material.dart';

mixin TextThemeMixin {
  TextTheme get textTheme => Theme.of(Global.context).textTheme;
}
