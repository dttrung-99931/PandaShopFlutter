// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/price_widget.dart';
import 'package:evievm_app/src/features/product/presentation/widget/shopping_cart/order_bottom_bar.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/spacing_row.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/sized_box.dart';

class ShoppingCartScreen extends StatefulWidget {
  static const router = '/shoppingCart';

  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  void initState() {
    super.initState();
    getIt<ShoppingCartBloc>().add(OnGetShoppingCart(9));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.background,
      body: CustomScrollView(
        slivers: [
          const _AppBar(),
          CustomBlocBuilder<ShoppingCartBloc>(
            isSliver: true,
            buildForStates: const [GetShoppingCartSuccess],
            builder: (state) {
              if (state is GetShoppingCartSuccess) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.data.items.length,
                    (context, index) {
                      CartItemDto item = state.data.items[index];
                      return CartItem(item: item);
                    },
                  ),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          ),
        ],
      ),
      bottomNavigationBar: const OrderBottomBar(),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.item,
  });

  final CartItemDto item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 0),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          IntrinsicHeight(
            child: ExtendedImage.network(
              item.product.thumbnailUrl,
              width: 72.r,
              height: 72.r,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          sw(8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sh(2.h),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 12.h * 2,
                  ),
                  child: Text(
                    item.product.name,
                    style: textTheme.bodyLarge?.withWeight(FontWeight.w500).overflowElipse().withColor(
                          AppColors.black.withOpacity(.8),
                        ),
                    maxLines: 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // PriceWidget(item.product.price, isOriginalPrice: true),
                    PriceWidget(item.product.price),
                    _ProductCounter(item: item),
                  ],
                ),
                sh(2.h),
                Row(
                  children: [
                    Icon(Icons.add_location_rounded, color: AppColors.blackLight.withOpacity(0.8), size: 16.r),
                    sw(4.w),
                    Text(
                      'Shop Drunk ABC',
                      style: textTheme.labelMedium?.withColor(AppColors.blackLight).overflowElipse(),
                      maxLines: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCounter extends StatelessWidget {
  const _ProductCounter({
    required this.item,
  });

  final CartItemDto item;

  @override
  Widget build(BuildContext context) {
    return SpacingRow(
      spacing: 4.w,
      children: [
        _Button(
          onPressed: () {},
          symbol: '-',
        ),
        Text(item.productNum.toString()),
        _Button(
          onPressed: () {},
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

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: true,
      leading: const BackButton(),
      stretchTriggerOffset: 56,
      floating: true,
      snap: true,
      elevation: 2.r,
      title: Text(
        'Giỏ hàng',
        style: textTheme.titleSmall?.withColor(AppColors.white),
      ),
    );
  }
}
