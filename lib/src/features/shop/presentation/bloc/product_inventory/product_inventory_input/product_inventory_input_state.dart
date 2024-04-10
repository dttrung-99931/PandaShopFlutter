part of 'product_inventory_input_bloc.dart';

class ProductInventoryInpsUpdated extends FullDataLoadedState<List<ProductInventoryInpDto>> {
  ProductInventoryInpsUpdated(super.data);
}

class GetProdsToSelectSucess extends ListLoadedState<ProductDto, int> {
  GetProdsToSelectSucess(
    super.data, {
    required this.productInventoryInpId,
    required super.selectedId,
  });
  final int? productInventoryInpId;
  @override
  int getId(ProductDto element) {
    return element.id;
  }

  @override
  bool get isValid => selectedId != Constatnts.idEmpty;
}
