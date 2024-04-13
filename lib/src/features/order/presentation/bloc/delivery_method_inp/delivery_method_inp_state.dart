// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delivery_method_inp_bloc.dart';

class GetShopOrderDeliveryMethodsSuccess extends ListLoadedState<DeliveryMethodDto, int> {
  GetShopOrderDeliveryMethodsSuccess(
    super.data, {
    required this.shop,
    required super.selectedId,
  });
  final ShopDto shop;

  @override
  int getId(DeliveryMethodDto element) {
    return element.id;
  }
}
