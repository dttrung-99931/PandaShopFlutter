// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_inventory_bloc.dart';

class OnGetProductInventory extends BaseEventWithoutProps {
  final int productId;
  OnGetProductInventory({
    required this.productId,
  });
}
