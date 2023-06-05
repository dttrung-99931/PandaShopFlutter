import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:flutter/material.dart';

class SpacingRow extends Row {
  SpacingRow({
    double spacing = 0,
    List<Widget> children = const [],
    super.mainAxisSize = MainAxisSize.max,
    super.mainAxisAlignment = MainAxisAlignment.start,
    super.crossAxisAlignment = CrossAxisAlignment.center,
    super.key,
  }) : super(
          children: children.addBetweenEvery(SizedBox(width: spacing)),
        );
}
