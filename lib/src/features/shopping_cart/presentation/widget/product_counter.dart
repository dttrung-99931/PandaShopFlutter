// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/shopping_cart/data/models/request/shopping_cart/upsert_cart_request_model.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/widget/cart_bottom_bar.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:evievm_app/src/shared/widgets/spacing_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter({
    super.key,
    required this.item,
    this.comfirmDelete = true,
    this.showCounter = true,
  });

  final CartItemDto item;
  final bool comfirmDelete;
  final bool showCounter;

  @override
  Widget build(BuildContext context) {
    return SpacingRow(
      spacing: 4.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        showCounter
            ? CustomBlocListener<ShoppingCartBloc>(
                listener: (state) {
                  if (state is DeleteCartItemsSuccess) {
                    shoppingCartBloc.add(OnGetShoppingCart());
                  }
                },
                child: _Button(
                  onPressed: () {
                    if (item.productNum == 1) {
                      if (!comfirmDelete) {
                        shoppingCartBloc.add(OnDeleteCartItems(items: [item]));
                        return;
                      }
                      showDialog(
                        context: context,
                        builder: (_) => DeleteCartItemsDialog(selected: [item]),
                      );
                      return;
                    }
                    shoppingCartBloc.add(
                      OnUpsertCart(
                        requestModel: UpsertCartRequestModel(
                          productOptionId: item.prouductOption.id,
                          productNum: item.productNum - 1,
                        ),
                      ),
                    );
                  },
                  symbol: '-',
                ),
              )
            : SizedBox(width: 8.w),
        Row(
          children: [
            Text(
              item.productNum.toString(),
              style: textTheme.bodyMedium.withWeight(showCounter ? FontWeight.normal : FontWeight.bold),
            ),
            if (!showCounter) ...[Text(' Sản phẩm', style: textTheme.bodyMedium)]
          ],
        ),
        showCounter
            ? _Button(
                isEnabled: item.productNum < item.prouductOption.remainingNum,
                onPressed: () {
                  shoppingCartBloc.add(
                    OnUpsertCart(
                      requestModel: UpsertCartRequestModel(
                        productOptionId: item.prouductOption.id,
                        productNum: item.productNum + 1,
                      ),
                    ),
                  );
                },
                symbol: '+',
              )
            : SizedBox(width: 8.w),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.symbol,
    required this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);
  final String symbol;
  final Function() onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: isEnabled ? onPressed : null,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary.withOpacity(isEnabled ? 0.6 : 0.3)),
            borderRadius: BorderRadius.circular(4.r),
          ),
          margin: EdgeInsets.all(8.r),
          alignment: Alignment.center,
          height: 28.r,
          width: 28.r,
          child: Text(
            symbol,
            style: textTheme.titleSmall
                ?.withColor(AppColors.primary.withOpacity(
                  isEnabled ? 1 : 0.3,
                ))
                .withHeight(1.08),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
