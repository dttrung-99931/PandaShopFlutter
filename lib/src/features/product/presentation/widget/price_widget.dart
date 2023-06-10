import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/format_utils.dart';
import '../../../../../global.dart';
import '../../../../config/theme.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
    this.price, {
    Key? key,
    this.isOriginalPrice = false,
  }) : super(key: key);

  final bool isOriginalPrice;
  final double price;

  @override
  Widget build(BuildContext context) {
    double opacity = isOriginalPrice ? .4 : .8;
    return Text.rich(
      textAlign: TextAlign.left,
      TextSpan(
          text: FormatUtils.formatMoney(price),
          style: (isOriginalPrice ? textTheme.bodyMedium : textTheme.bodyLarge)?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.primary.withOpacity(opacity),
            decoration: isOriginalPrice ? TextDecoration.lineThrough : TextDecoration.none,
          ),
          children: const [
            TextSpan(
              text: Global.currencySymbol,
            )
          ]),
    );
  }
}
