// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_inventory_bloc.dart';

class OnGetProductInventory extends BaseEvent {
  final int productId;
  OnGetProductInventory({
    required this.productId,
  });

  @override
  List<Object?> get props => [productId];
}
