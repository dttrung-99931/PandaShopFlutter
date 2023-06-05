import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class Selectable extends Equatable {
  bool isSelected;

  Selectable({this.isSelected = false});
}
