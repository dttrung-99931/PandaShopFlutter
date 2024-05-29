// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';

import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Widget display points, minutes, ... with optional top title
class ValueDisplayWidget extends StatelessWidget {
  const ValueDisplayWidget({
    super.key,
    required this.value,
    this.showPlusSign = false,
    this.showPlusMinusSignIfValueZero = false,
    this.valueColor = EVMColors.blackLight,
    this.titleColor = EVMColors.grey4,
    this.unit = 'Pt',
    this.title = '',
    this.isUnitBold = true,
    this.valueMarginLeft = 0,
    this.valuePrecision = 0,
  });

  final double value;
  final int valuePrecision;
  final bool showPlusSign;
  final bool showPlusMinusSignIfValueZero;
  final Color valueColor;
  final Color titleColor;
  final String unit;
  final String title;
  final bool isUnitBold;
  final double valueMarginLeft;
  // TODO: display double precision value
  double get valueFontSize => value.toStringAsFixed(0).length <= 5 ? 28.sp : 20.sp;

  @override
  Widget build(BuildContext context) {
    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (valueMarginLeft > 0) sw(valueMarginLeft),
        Text(
          (value != 0
                  ? showPlusSign && value > 0
                      ? '+'
                      : ''
                  : showPlusMinusSignIfValueZero
                      ? '±'
                      : '') +
              value.toStringAsFixed(valuePrecision),
          style: TextStyle(
            color: valueColor,
            fontSize: valueFontSize,
            height: 1.2,
          ),
          maxLines: 1,
        ),
        const SizedBox(width: 2),
        Text(
          unit.tr(),
          style: TextStyle(
            color: valueColor,
            fontSize: 14.sp,
            fontWeight: isUnitBold ? FontWeight.bold : FontWeight.normal,
            height: 2.5,
          ),
        ),
      ],
    );
    if (title.isEmpty) return content;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr(title),
          style: textTheme.labelMedium?.copyWith(color: titleColor),
        ),
        content,
      ],
    );
  }
}
