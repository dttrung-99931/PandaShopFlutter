// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/delivery_method_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/payement_method_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/shop_response_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';

part 'order_inp_dto_ext.dart';

class CreateOrderDto extends Equatable {
  final List<CartItemDto> items;
  final List<SubOrderInputDto> subOrders;
  final PaymentMethodDto? selectedPayemntMethod;
  const CreateOrderDto({
    required this.items,
    required this.subOrders,
    required this.selectedPayemntMethod,
  });

  CreateOrderDto.fromCartItems({
    required this.items,
    this.selectedPayemntMethod,
  }) : subOrders = items.groupBy((p0) => p0.shop).entries.mapList(
              (MapEntry<ShopDto, List<CartItemDto>> entry) => SubOrderInputDto(
                items: entry.value,
                shop: entry.key,
              ),
            );

  @override
  List<Object?> get props => [items, subOrders];

  CreateOrderDto copyWith({
    List<CartItemDto>? items,
    List<SubOrderInputDto>? subOrders,
    PaymentMethodDto? selectedPayemntMethod,
  }) {
    return CreateOrderDto(
      items: items ?? this.items,
      subOrders: subOrders ?? this.subOrders,
      selectedPayemntMethod: selectedPayemntMethod ?? this.selectedPayemntMethod,
    );
  }
}

class SubOrderInputDto extends Equatable {
  final List<CartItemDto> items;
  final List<DeliveryMethodDto> availableDeliveryMethods;
  final ShopDto shop;
  final DeliveryMethodDto? selectedDelivery;
  final AddressDto? selectedAddress;

  SubOrderInputDto({
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

  SubOrderInputDto copyWith({
    List<CartItemDto>? items,
    ShopDto? shop,
    DeliveryMethodDto? selectedDelivery,
    AddressDto? selectedAddress,
  }) {
    return SubOrderInputDto(
      items: items ?? this.items,
      shop: shop ?? this.shop,
      selectedDelivery: selectedDelivery ?? this.selectedDelivery,
      selectedAddress: selectedAddress ?? this.selectedAddress,
    );
  }
}
