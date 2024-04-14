// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/delivery_method_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/payement_method_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/shop_response_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';

part 'sub_order_ext.dart';

class OrderConfirmDto extends Equatable {
  final List<CartItemDto> items;
  final List<SubOrderDto> shopOrdersComfirms;
  final PaymentMethodDto? selectedPayemntMethod;

  OrderConfirmDto({
    required this.items,
    this.selectedPayemntMethod,
  }) : shopOrdersComfirms = items.groupBy((p0) => p0.shop).entries.mapList(
              (MapEntry<ShopDto, List<CartItemDto>> entry) => SubOrderDto(
                items: entry.value,
                shop: entry.key,
              ),
            );

  @override
  List<Object?> get props => [items, shopOrdersComfirms];

  OrderConfirmDto copyWith({
    List<CartItemDto>? items,
    PaymentMethodDto? selectedPayemntMethod,
  }) {
    return OrderConfirmDto(
      items: items ?? this.items,
      selectedPayemntMethod: selectedPayemntMethod ?? this.selectedPayemntMethod,
    );
  }
}

class SubOrderDto extends Equatable {
  final List<CartItemDto> items;
  final List<DeliveryMethodDto> availableDeliveryMethods;
  final ShopDto shop;
  final DeliveryMethodDto? selectedDelivery;

  SubOrderDto({
    required this.items,
    required this.shop,
    this.selectedDelivery,
  }) : availableDeliveryMethods = items.fold(
          [],
          (List<DeliveryMethodDto> available, CartItemDto item) => {...item.deliveryMethods, ...available}.toList(),
        );

  @override
  List<Object?> get props => [shop];

  SubOrderDto copyWith({
    List<CartItemDto>? items,
    List<DeliveryMethodDto>? availableDeliveryMethods,
    ShopDto? shop,
    DeliveryMethodDto? selectedDelivery,
  }) {
    return SubOrderDto(
      items: items ?? this.items,
      shop: shop ?? this.shop,
      selectedDelivery: selectedDelivery ?? this.selectedDelivery,
    );
  }
}
