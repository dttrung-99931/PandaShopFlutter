// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class Selectable extends Equatable {
  bool isSelected;
  dynamic get selectId;

  Selectable({
    this.isSelected = false,
  });

  @override
  List<Object?> get props => [isSelected, selectId];
}
