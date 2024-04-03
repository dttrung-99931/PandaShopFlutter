// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shop_product_bloc.dart';

class OnGetShopProducts extends BaseEventWithoutProps {}

class OnGetShopProductCates extends BaseEventWithoutProps {}

class OnGetShopBanners extends BaseEventWithoutProps {}

class OnDeleteProduct extends BaseEvent {
  final int productId;
  OnDeleteProduct({
    required this.productId,
  });
  @override
  List<Object?> get props => [productId];
}
