import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/order/presentation/widget/order_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Buy button * subtotal prices
class OrderBottomBar extends StatelessWidget {
  const OrderBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.zero,
      child: SizedBox(
        height: 56.h,
        child: const Row(
          children: [
            _BackButton(),
            Expanded(
              child: OrderButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.45.sw,
      child: TextButton(
        onPressed: Global.pop,
        child: Text("Trở lại", style: textTheme.bodyLarge),
      ),
    );
  }
}
