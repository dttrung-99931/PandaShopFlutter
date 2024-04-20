// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto_ext.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/widget/cart_bottom_bar.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/widget/cart_item.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    shoppingCartBloc.add(OnGetShoppingCart(clearSelectedItems: true));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: EVMColors.background,
      body: CustomScrollView(
        slivers: [
          _AppBar(),
          _Body(),
        ],
      ),
      bottomNavigationBar: CartBottomBar(),
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
      title: CustomBlocBuilder<ShoppingCartBloc>(
        builder: (state) {
          return Text(
            'Giỏ hàng${state is ShoppingCartUpdated ? ' (${state.data.total} sản phẩm)' : ''}',
            style: textTheme.titleSmall?.withColor(AppColors.white),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<ShoppingCartBloc>(
      isSliver: true,
      buildCondition: (state) => state is ShoppingCartUpdated,
      builder: (state) {
        if (state is ShoppingCartUpdated) {
          if (state.data.items.isEmpty) {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: Text('Giỏ hàng trống!', style: textTheme.bodyMedium)),
            );
          }
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
    );
  }
}
