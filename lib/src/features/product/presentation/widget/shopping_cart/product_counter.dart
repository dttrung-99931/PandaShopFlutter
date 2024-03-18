// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/data/models/request/shopping_cart/upsert_cart_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/shopping_cart/cart_bottom_bar.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:evievm_app/src/shared/widgets/spacing_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter({
    super.key,
    required this.item,
    this.comfirmDelete = true,
  });

  final CartItemDto item;
  final bool comfirmDelete;

  @override
  Widget build(BuildContext context) {
    return SpacingRow(
      spacing: 4.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomBlocListener<ShoppingCartBloc>(
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
        ),
        Text(item.productNum.toString()),
        _Button(
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
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.symbol,
    required this.onPressed,
  }) : super(key: key);
  final String symbol;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(4.r),
          ),
          margin: EdgeInsets.all(8.r),
          alignment: Alignment.center,
          height: 24.r,
          width: 24.r,
          child: Text(
            symbol,
            style: textTheme.titleSmall?.withColor(AppColors.primary).withHeight(1.15),
          ),
        ),
      ),
    );
  }
}
