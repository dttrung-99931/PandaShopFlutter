part of 'product_batch_input_bloc.dart';

class ProductBatchAdded extends FullDataLoadedState<ProductBatchInputDto> {
  ProductBatchAdded(super.data);
}

class GetProductOptsToSelectSucess extends ListLoadedState<ProductOptionDto, int> {
  GetProductOptsToSelectSucess(
    super.data, {
    required this.productBatchInpId,
    required super.selectedId,
  });
  final int? productBatchInpId;
  @override
  int getId(ProductOptionDto element) {
    return element.id;
  }

  @override
  bool get isValid => selectedId != Constants.idEmpty;
}
