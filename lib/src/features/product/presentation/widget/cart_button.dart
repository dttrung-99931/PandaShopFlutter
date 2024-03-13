import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/presentation/screens/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    this.size,
  });
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          iconSize: size,
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            Global.pushNamed(ShoppingCartScreen.router);
          },
        ),
        Positioned(
          top: 4.h,
          right: 4.w,
          child: Container(
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [BoxShadow(color: AppColors.grey, blurRadius: 4.r)],
              shape: BoxShape.circle,
            ),
            child: Text('10', style: textTheme.bodySmall?.withColor(AppColors.primary).bold()),
          ),
        ),
      ],
    );
  }
}
