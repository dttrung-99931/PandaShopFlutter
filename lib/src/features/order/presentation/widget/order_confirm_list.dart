// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/order/domain/dto/order_confirm_dto.dart';
import 'package:evievm_app/src/features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/delivery_method_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/widget/cart_item.dart';
import 'package:evievm_app/src/shared/widgets/common/custom_dropdown_input.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:evievm_app/src/shared/widgets/utils/color_container.dart';
import 'package:flutter/material.dart';

class OrderConfirmList extends StatelessWidget {
  const OrderConfirmList({
    super.key,
    required this.orderConfirm,
  });
  final OrderConfirmDto orderConfirm;
  List<CartItemDto> get items => orderConfirm.items;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: orderConfirm.shopOrdersComfirms.length,
        (context, index) {
          return ShopOrderConfirm(item: orderConfirm.shopOrdersComfirms[index]);
        },
      ),
    );
  }
}

class ShopOrderConfirm extends StatelessWidget {
  const ShopOrderConfirm({
    super.key,
    required this.item,
  });

  final ShopOrderComfirmDto item;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: item.shop.name,
      child: Column(
        children: [
          ...item.items.mapList((cartItem) => CartItem(item: cartItem, mode: CartItemMode.order)),
          _PaymentMethodSelect(shopOrderConfirm: item),
        ],
      ),
    );
  }
}

class _PaymentMethodSelect extends StatefulWidget {
  const _PaymentMethodSelect({
    Key? key,
    required this.shopOrderConfirm,
  }) : super(key: key);
  final ShopOrderComfirmDto shopOrderConfirm;

  @override
  State<_PaymentMethodSelect> createState() => _PaymentMethodSelectState();
}

class _PaymentMethodSelectState extends State<_PaymentMethodSelect> {
  @override
  void initState() {
    deliveryMethodInpBloc.add(OnGetShopOrderDeliveryMethods(
      selectedId: null,
      shopOrderConfirm: widget.shopOrderConfirm,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdownInput<DeliveryMethodDto, int, GetShopOrderDeliveryMethodsSuccess, DeliveryMethodInpBloc>(
      title: 'Phương thức giao hàng',
      onSelected: (DeliveryMethodDto selected) {
        deliveryMethodInpBloc.add(OnDeliveryMethodSelected(
          selected: selected,
          shopOrderConfirm: widget.shopOrderConfirm,
        ));
      },
      buildCondition: (state) {
        return state is GetShopOrderDeliveryMethodsSuccess && state.shop == widget.shopOrderConfirm.shop;
      },
      nameGetter: (DeliveryMethodDto selected) {
        return selected.name;
      },
    );
  }
}
