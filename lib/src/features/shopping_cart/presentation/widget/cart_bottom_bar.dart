import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto_ext.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/price_widget.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/widget/order_button.dart';
import 'package:evievm_app/src/shared/widgets/app_alert_dialog.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Buy button * subtotal prices
class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SelectedCartItemsOverview(),
        Card(
          elevation: 8,
          margin: EdgeInsets.zero,
          child: SizedBox(
            height: 56.h,
            child: const Row(
              children: [
                ViewMoreButton(),
                Expanded(
                  child: OrderButton(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SelectedCartItemsOverview extends StatelessWidget {
  const SelectedCartItemsOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<ShoppingCartBloc>(
      builder: (state) {
        if (state is! ShoppingCartUpdated || state.data.selectedItems.isEmpty) {
          return emptyWidget;
        }
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(state.data.totalSelected.toString(), style: textTheme.bodyMedium.bold()),
                  sw(4.w),
                  const Text('sản phẩm đã chọn'),
                  const Spacer(),
                  DeleteCartItemsButton(selected: state.data.selected)
                ],
              ),
              PriceWidget(state.data.totalPriceOfSelected),
            ],
          ),
        );
      },
    );
  }
}

class DeleteCartItemsButton extends StatelessWidget {
  const DeleteCartItemsButton({
    required this.selected,
    super.key,
  });
  final List<CartItemDto> selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => DeleteCartItemsDialog(selected: selected),
        );
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(8.w, 2.h, 4.w, 2.h),
        child: Text('Xóa', style: textTheme.bodyMedium.withColor(AppColors.redDeep)),
      ),
    );
  }
}

class DeleteCartItemsDialog extends StatelessWidget {
  const DeleteCartItemsDialog({
    super.key,
    required this.selected,
  });

  final List<CartItemDto> selected;

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      title: 'Xác nhận xóa sản phẩm khỏi giỏ hàng',
      confirmLabel: 'Xác nhận',
      width: 400.w,
      onConfirm: () {
        shoppingCartBloc.add(OnDeleteCartItems(items: selected));
      },
    );
  }
}

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.45.sw,
      child: TextButton(
        onPressed: () {},
        child: Text("Xem thêm", style: textTheme.bodyLarge),
      ),
    );
  }
}
