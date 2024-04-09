import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:evievm_app/src/features/product/domain/dto/shopping_cart/shopping_cart_dto_ext.dart';
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
          padding: EdgeInsets.all(8.r),
          icon: Container(
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(.8),
              borderRadius: BorderRadius.circular(size ?? 32.r),
            ),
            padding: EdgeInsets.all(4.r),
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(1.w, 1.h),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.primary.withOpacity(.8),
              ),
            ),
          ),
          onPressed: () {
            loginBloc.add(OnDoCheckLogin(
              onDidLogin: () {
                Global.pushNamedSafe(ShoppingCartScreen.router);
              },
              onNotLogin: () {
                Global.pushNamedSafe(LoginScreen.router);
              },
            ));
          },
        ),
        CustomBlocBuilder<LoginBloc>(
            buildForStates: const [CheckLoginSuccess],
            builder: (loginState) {
              if (loginState is LoginSuccess || (loginState is CheckLoginSuccess && loginState.isLoggedIn)) {
                return CustomBlocBuilder<ShoppingCartBloc>(
                    buildCondition: (state) => state is ShoppingCartUpdated,
                    builder: (state) {
                      if (state is! ShoppingCartUpdated) {
                        return emptyWidget;
                      }
                      bool hasManyItems = state.data.total > 10;
                      return Positioned(
                        top: 4.h,
                        right: hasManyItems ? 4.w : 1.w,
                        child: Container(
                          padding: EdgeInsets.all((hasManyItems ? 4 : 6).r),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [BoxShadow(color: AppColors.grey, blurRadius: 4.r)],
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            state.data.totalItems.toString(),
                            style: textTheme.bodyMedium?.withColor(AppColors.primary).bold(),
                          ),
                        ),
                      );
                    });
              }
              return emptyWidget;
            }),
      ],
    );
  }
}
