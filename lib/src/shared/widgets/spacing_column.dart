import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:flutter/material.dart';

class SpacingColumn extends Column {
  SpacingColumn({
    double spacing = 0,
    List<Widget> children = const [],
    super.mainAxisSize = MainAxisSize.max,
    super.mainAxisAlignment = MainAxisAlignment.start,
    super.crossAxisAlignment = CrossAxisAlignment.start,
    super.key,
  }) : super(
          children: children.addBetweenEvery(SizedBox(height: spacing)),
        );
}
