import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/format_utils.dart';
import '../../../../../../global.dart';
import '../../../../../config/theme/app_theme.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
    this.price, {
    super.key,
    this.isOriginalPrice = false,
    this.unit = Global.currencySymbol,
    this.isLarge = false,
  });

  final bool isOriginalPrice;
  final double price;
  final String unit;
  final bool isLarge;

  TextStyle get originPriceStyle => isLarge ? textTheme.bodyLarge! : textTheme.bodyMedium!;
  TextStyle get currentPriceStyle => isLarge ? textTheme.titleMedium! : textTheme.bodyLarge!;
  double get opacity => isOriginalPrice
      ? isLarge
          ? 1
          : .4
      : .8;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.left,
      TextSpan(
        text: FormatUtils.formatMoney(price),
        style: (isOriginalPrice ? originPriceStyle : currentPriceStyle).copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.primary.withOpacity(opacity),
          decoration: isOriginalPrice ? TextDecoration.lineThrough : TextDecoration.none,
        ),
        children: [TextSpan(text: unit)],
      ),
    );
  }
}
