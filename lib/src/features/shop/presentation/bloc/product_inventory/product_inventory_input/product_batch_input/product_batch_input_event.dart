// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_batch_input_bloc.dart';

class OnAddProductBatchInput extends BaseEvent {
  final int productInventoryId;
  final int productId;
  OnAddProductBatchInput({
    required this.productInventoryId,
    required this.productId,
  });

  @override
  List<Object?> get props => [productInventoryId, productId];
}

class OnProdOptionSelected extends BaseEvent {
  final int productBatchInpId;
  final ProductOptionDto selectedOption;
  OnProdOptionSelected({
    required this.productBatchInpId,
    required this.selectedOption,
  });

  @override
  List<Object?> get props => [productBatchInpId, selectedOption];
}

class OnGetProdOptionsToSelect extends BaseEvent {
  final int productBatchnInpId;
  final String? q;
  OnGetProdOptionsToSelect({
    required this.productBatchnInpId,
    this.q,
  });

  @override
  List<Object?> get props => [q, productBatchnInpId];
}
