// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shop_product_detail_bloc.dart';

class OnInitShopProduct extends BaseEvent {
  final int? productId;
  OnInitShopProduct({
    this.productId,
  });
  @override
  List<Object?> get props => [productId];
}

class OnSaveProduct extends BaseEventWithoutProps {}
