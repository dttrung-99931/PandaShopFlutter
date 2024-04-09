import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/order/presentation/widget/order_confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Buy button * subtotal prices
class OrderBottomBar extends StatelessWidget {
  const OrderBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.zero,
      child: SizedBox(
        height: 56.h,
        child: Row(
          children: const [
            _BackButton(),
            Expanded(
              child: OrderConfirmButton(),
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
