// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/account_screen.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/sub_order_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/widget/cart_item.dart';
import 'package:evievm_app/src/shared/widgets/common/app_chip.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:evievm_app/src/shared/widgets/sliver/sliver_sized_box.dart';
import 'package:evievm_app/src/shared/widgets/spacing_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopOrderScreen extends StatefulWidget {
  static const router = '/shopOrder';

  const ShopOrderScreen({super.key});

  @override
  State<ShopOrderScreen> createState() => _ShopOrderScreenState();
}

class _ShopOrderScreenState extends State<ShopOrderScreen> {
  @override
  void initState() {
    super.initState();
    shopOrderBloc.add(OnSelectOrderStatus(selected: shopOrderBloc.selectedStatus));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.background,
      body: RefreshIndicator(
        onRefresh: () async {
          shopOrderBloc.add(OnGetShopOrders(orderStatus: shopOrderBloc.selectedStatus));
        },
        child: const CustomScrollView(
          slivers: [
            _AppBar(),
            _OrderStatusesTab(),
            _OrderList(),
          ],
        ),
      ),
    );
  }
}

class _OrderStatusesTab extends StatelessWidget {
  const _OrderStatusesTab();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 12, 2),
        child: CustomBlocBuilder<ShopOrderBloc>(
            buildForStates: const [DisplayOrderStatusesUpdated],
            handleLoading: false,
            builder: (state) {
              if (state is! DisplayOrderStatusesUpdated) {
                return emptyWidget;
              }
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SpacingRow(
                    spacing: 8.w,
                    children: state.data.mapList(
                      (status) => AppChip(
                        label: status.title,
                        isSelected: status == state.selected,
                        onPressed: () {
                          shopOrderBloc.add(OnSelectOrderStatus(selected: status));
                        },
                      ),
                    )),
              );
            }),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.primaryShop,
      automaticallyImplyLeading: false,
      stretchTriggerOffset: 56,
      floating: true,
      snap: true,
      elevation: 2.r,
      title: Text('Đơn hàng', style: textTheme.titleSmall?.withColor(AppColors.white)),
      // title: CustomBlocBuilder<ShopOrderBloc>(
      //   builder: (state) {
      //     return Text(
      //       'Đơn hàng${state is ShoppingCartUpdated ? ' (${state.data.total})' : ''}',
      //       style: textTheme.titleSmall?.withColor(AppColors.white),
      //     );
      //   },
      // ),
    );
  }
}

class _OrderList extends StatelessWidget {
  const _OrderList();

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<ShopOrderBloc>(
      isSliver: true,
      buildForStates: const [GetShopOrdersSuccess],
      builder: (state) {
        if (state is! GetShopOrdersSuccess) {
          return const SliverSizedBox();
        }
        if (state.data.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('Đơn hàng trống!', style: textTheme.bodyMedium)),
          );
        }
        return ShopOrderSliverList(orders: state.data);
      },
    );
  }
}

class ShopOrderSliverList extends StatelessWidget {
  const ShopOrderSliverList({
    Key? key,
    required this.orders,
  }) : super(key: key);
  final List<OrderDto> orders;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: orders.length,
        (context, index) {
          OrderDto order = orders[index];
          return ShopOrderItem(order: order);
        },
      ),
    );
  }
}

class ShopOrderItem extends StatelessWidget {
  const ShopOrderItem({
    super.key,
    required this.order,
  });

  final OrderDto order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              ...order.subOrders.mapList(
                (subOrder) => ShopSubOrderItem(subOrder: subOrder),
              )
            ],
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: Avatar(size: 20.r),
          )
        ],
      ),
    );
  }
}

class ShopSubOrderItem extends StatelessWidget {
  const ShopSubOrderItem({
    Key? key,
    required this.subOrder,
  }) : super(key: key);
  final SubOrderDto subOrder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...subOrder.subOrderDetails.mapList(
          (detail) => CartItem(
            item: CartItemDto.from(
              subOrderDetail: detail,
              shop: Global.shop!,
            ),
            mode: CartItemMode.shopOrder,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 8.shb,
              Section(
                title: subOrder.delivery.deliveryMethod.name,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subOrder.delivery.address.address),
                  ],
                ),
              ),
              if (subOrder.note != null) ...[
                8.shb,
                Section(
                  title: 'Ghi chú',
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subOrder.note!),
                    ],
                  ),
                )
              ],
              8.shb,
            ],
          ),
        ),
      ],
    );
  }
}
