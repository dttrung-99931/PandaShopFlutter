// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/presentation/widgets/address/address_input.dart';
import 'package:evievm_app/src/features/order/domain/dto/create_orders_dto.dart';
import 'package:evievm_app/src/features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart';
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/delivery_method_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/widget/cart_item.dart';
import 'package:evievm_app/src/shared/widgets/common/custom_dropdown_input.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubOrderList extends StatelessWidget {
  const SubOrderList({
    super.key,
    required this.orderConfirm,
  });
  final CreateOrdersDto orderConfirm;
  List<CartItemDto> get items => orderConfirm.items;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: orderConfirm.orderDetails.length,
        (context, index) {
          return SubOrder(suborder: orderConfirm.orderDetails[index]);
        },
      ),
    );
  }
}

class SubOrder extends StatelessWidget {
  const SubOrder({super.key, required this.suborder});

  final OrderInputDto suborder;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: suborder.shop.name,
      child: Column(
        children: [
          ...suborder.items.mapList((cartItem) => CartItem(
                item: cartItem,
                mode: CartItemMode.order,
              )),
          4.shb,
          AddressInput(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            onSelected: (AddressDto selected) {
              orderBloc.add(OnChangeAddress(
                address: selected,
                shop: suborder.shop,
              ));
            },
          ),
          4.shb,
          _DeliveryMethodSelect(subOrder: suborder),
        ],
      ),
    );
  }
}

class _DeliveryMethodSelect extends StatefulWidget {
  const _DeliveryMethodSelect({
    required this.subOrder,
  });
  final OrderInputDto subOrder;

  @override
  State<_DeliveryMethodSelect> createState() => _DeliveryMethodSelectState();
}

class _DeliveryMethodSelectState extends State<_DeliveryMethodSelect> {
  @override
  void initState() {
    deliveryMethodInpBloc.add(OnGetShopOrderDeliveryMethods(
      selectedId: null,
      subOrder: widget.subOrder,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      titlePadding: EdgeInsets.only(bottom: 8.h),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: CustomDropdownInput<DeliveryMethodDto, int, GetShopOrderDeliveryMethodsSuccess, DeliveryMethodInpBloc>(
        direction: Axis.vertical,
        titleFontWeight: FontWeight.bold,
        title: 'Phương thức giao hàng',
        onSelected: (DeliveryMethodDto selected) {
          deliveryMethodInpBloc.add(OnDeliveryMethodSelected(
            selected: selected,
            shopOrderConfirm: widget.subOrder,
          ));
        },
        buildCondition: (state) {
          return state is GetShopOrderDeliveryMethodsSuccess && state.shop == widget.subOrder.shop;
        },
        nameGetter: (DeliveryMethodDto selected) {
          return selected.name;
        },
      ),
    );
  }
}
