import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/screens/order_screen.dart';
import 'package:flutter/material.dart';

class OrderConfirmButton extends StatelessWidget {
  const OrderConfirmButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CustomClipPath(),
      child: Container(
        color: AppColors.primary,
        margin: const EdgeInsets.all(4),
        child: TextButton(
          onPressed: () {
            Global.pushNamed(
              OrderScreen.router,
              args: OrderScreenArgs(items: shoppingCartBloc.selectedItems),
            );
          },
          child: Text(
            "Xác nhận đặt hàng",
            style: textTheme.bodyLarge?.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

class _CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(24, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
  // oldClipper != this
}