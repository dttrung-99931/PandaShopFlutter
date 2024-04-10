// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_inventory_input_bloc.dart';

class OnAddInventoryInput extends BaseEventWithoutProps {}

class OnProductBatchAdded extends BaseEvent {
  final ProductBatchInputDto productBatch;
  OnProductBatchAdded({
    required this.productBatch,
  });
  @override
  List<Object?> get props => [productBatch];
}

class OnGetShopProdsToSelect extends BaseEvent {
  final String? q;
  OnGetShopProdsToSelect({
    this.q,
  });

  @override
  List<Object?> get props => [q];
}

class OnInventoryProdSelected extends BaseEvent {
  final int productInventoryInpId;
  final ProductDto selectedProduct;
  OnInventoryProdSelected({
    required this.productInventoryInpId,
    required this.selectedProduct,
  });

  @override
  List<Object?> get props => [productInventoryInpId, selectedProduct];
}
