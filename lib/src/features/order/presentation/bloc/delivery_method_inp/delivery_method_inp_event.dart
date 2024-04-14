// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delivery_method_inp_bloc.dart';

class OnGetShopOrderDeliveryMethods extends OnGetListSelect {
  final SubOrderDto shopOrderConfirm;
  OnGetShopOrderDeliveryMethods({required super.selectedId, required this.shopOrderConfirm});
}

class OnDeliveryMethodSelected extends OnSelect<DeliveryMethodDto> {
  OnDeliveryMethodSelected({
    required super.selected,
    required this.shopOrderConfirm,
  });
  final SubOrderDto shopOrderConfirm;
}
