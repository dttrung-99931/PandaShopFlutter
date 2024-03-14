import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/screens/shopping_cart_screen.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
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
          child: CustomBlocBuilder<ShoppingCartBloc>(
              buildCondition: (state) => state is ShoppingCartUpdated,
              builder: (state) {
                if (state is! ShoppingCartUpdated) {
                  return emptyWidget;
                }
                return Container(
                  padding: EdgeInsets.all(state.data.totalItems < 10 ? 4.r : 2.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [BoxShadow(color: AppColors.grey, blurRadius: 4.r)],
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    state.data.totalItems.toString(),
                    style: textTheme.bodySmall?.withColor(AppColors.primary).bold(),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
