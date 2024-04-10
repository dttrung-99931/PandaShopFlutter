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

class OnGetProdsToSelect extends BaseEvent {
  final int productInventoryInpId;
  final String? q;
  OnGetProdsToSelect({
    required this.productInventoryInpId,
    this.q,
  });

  @override
  List<Object?> get props => [q, productInventoryInpId];
}

class OnProdSelected extends BaseEvent {
  final int productInventoryInpId;
  final ProductDto selectedProduct;
  OnProdSelected({
    required this.productInventoryInpId,
    required this.selectedProduct,
  });

  @override
  List<Object?> get props => [productInventoryInpId, selectedProduct];
}
