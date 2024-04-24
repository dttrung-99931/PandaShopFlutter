// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/delivery_method_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/payement_method_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/shop_response_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';

part 'create_orders_dto_ext.dart';

class CreateOrdersDto extends Equatable {
  final List<CartItemDto> items;
  final List<OrderInputDto> orderDetails;
  final PaymentMethodDto? selectedPayemntMethod;
  const CreateOrdersDto({
    required this.items,
    required this.orderDetails,
    required this.selectedPayemntMethod,
  });

  CreateOrdersDto.fromCartItems({
    required this.items,
    this.selectedPayemntMethod,
  }) : orderDetails = items.groupBy((p0) => p0.shop).entries.mapList(
              (MapEntry<ShopDto, List<CartItemDto>> entry) => OrderInputDto(
                items: entry.value,
                shop: entry.key,
              ),
            );

  @override
  List<Object?> get props => [items, orderDetails];

  CreateOrdersDto copyWith({
    List<CartItemDto>? items,
    List<OrderInputDto>? orderDetails,
    PaymentMethodDto? selectedPayemntMethod,
  }) {
    return CreateOrdersDto(
      items: items ?? this.items,
      orderDetails: orderDetails ?? this.orderDetails,
      selectedPayemntMethod: selectedPayemntMethod ?? this.selectedPayemntMethod,
    );
  }
}

class OrderInputDto extends Equatable {
  final List<CartItemDto> items;
  final List<DeliveryMethodDto> availableDeliveryMethods;
  final ShopDto shop;
  final DeliveryMethodDto? selectedDelivery;
  final AddressDto? selectedAddress;

  OrderInputDto({
    required this.items,
    required this.shop,
    this.selectedDelivery,
    this.selectedAddress,
  }) : availableDeliveryMethods = items.fold(
          [],
          (List<DeliveryMethodDto> available, CartItemDto item) => {...item.deliveryMethods, ...available}.toList(),
        );

  @override
  List<Object?> get props => [shop, selectedDelivery, selectedAddress, availableDeliveryMethods];

  OrderInputDto copyWith({
    List<CartItemDto>? items,
    ShopDto? shop,
    DeliveryMethodDto? selectedDelivery,
    AddressDto? selectedAddress,
  }) {
    return OrderInputDto(
      items: items ?? this.items,
      shop: shop ?? this.shop,
      selectedDelivery: selectedDelivery ?? this.selectedDelivery,
      selectedAddress: selectedAddress ?? this.selectedAddress,
    );
  }
}
