// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/ui/auto_reset_bloc_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:evievm_app/src/features/order/presentation/widget/order_bottom_bar.dart';
import 'package:evievm_app/src/features/order/presentation/widget/sub_order_list.dart';
import 'package:evievm_app/src/features/order/presentation/widget/payment_method_select.dart';
import 'package:evievm_app/src/features/order/presentation/widget/subtotal_price.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
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
    super.key,
  });
  final OrderScreenArgs args;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends AutoResetBlocState<OrderScreen, OrderBloc> {
  @override
  void initState() {
    super.initState();
    orderBloc.add(OnCreateOrderInput(items: widget.args.items));
  }

  @override
  void dispose() {
    getIt.resetLazySingleton<OrderBloc>();
    super.dispose();
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
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    slivers: [
                      SubOrderList(orderConfirm: state.data),
                      SliverSizedBox(height: 4.h),
                      SubtotalPrices(orderConfirm: state.data),
                      SliverSizedBox(height: 4.h),
                      SliverToBoxAdapter(
                          child: Section(
                        child: const PaymentMethodSelect(),
                      )),
                    ],
                  );
                }
                return emptyWidget;
              },
            ),
          ),
          SliverSizedBox(height: 8.h),
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
