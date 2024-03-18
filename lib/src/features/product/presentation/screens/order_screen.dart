// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/order/order_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/order/cart_item_confirm_list.dart';
import 'package:evievm_app/src/features/product/presentation/widget/order/order_bottom_bar.dart';
import 'package:evievm_app/src/features/product/presentation/widget/order/subtotal_price.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/sliver/sliver_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreenArgs {
  final List<CartItemDto> items;
  OrderScreenArgs({
    required this.items,
  });
}

class OrderScreen extends StatefulWidget {
  static const router = '/order';

  const OrderScreen(
    this.args, {
    Key? key,
  }) : super(key: key);
  final OrderScreenArgs args;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
    orderBloc.add(OnGetOrderComfirm(items: widget.args.items));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.background,
      body: CustomScrollView(
        slivers: [
          const _AppBar(),
          SliverToBoxAdapter(
            child: CustomBlocBuilder<OrderBloc>(
              buildForStates: const [GetOrderConfirmSuccess],
              builder: (state) {
                if (state is GetOrderConfirmSuccess) {
                  return CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      CartItemConfirmList(orderConfirm: state.data),
                      SliverSizedBox(height: 8.h),
                      SubtotalPrices(orderConfirm: state.data),
                    ],
                  );
                }
                return emptyWidget;
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: const OrderBottomBar(),
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
        'Đặt hàng',
        style: textTheme.titleSmall?.withColor(AppColors.white),
      ),
    );
  }
}
