// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/product_inventory_screen.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopProductDetailBottomBar extends StatelessWidget {
  const ShopProductDetailBottomBar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
      child: CustomBlocBuilder<ProductOptionBloc>(
          buildForStates: const [OptionSelectedChanged],
          builder: (state) {
            if (state is! OptionSelectedChanged) {
              return emptyWidget;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      state.selectedOption?.remainingNum.toString() ?? '0',
                      style: textTheme.bodyLarge.bold(),
                    ),
                    sw(4.w),
                    Text('sản phẩm trong kho', style: textTheme.bodyLarge),
                  ],
                ),
                2.shb,
                const ViewProductInventoryBotton(),
              ],
            );
          }),
    );
  }
}

class ViewProductInventoryBotton extends StatelessWidget {
  const ViewProductInventoryBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CustomClipPath(),
      child: Container(
        color: AppColors.primary,
        margin: const EdgeInsets.all(2),
        height: 48.h,
        child: TextButton(
          onPressed: () {
            Global.pushNamed(
              ProductInventoryScreen.router,
              args: ProductInventoryArgs(productId: productDetailBloc.productDetail.id),
            );
          },
          child: Text(
            "Xem kho",
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
    path.lineTo(16, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - 16, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
  // oldClipper != this
}
