part of 'product_inventory_input_bloc.dart';

class ProductInventoryInpsUpdated extends FullDataLoadedState<List<ProductInventoryInpDto>> {
  ProductInventoryInpsUpdated(super.data);
}

class GetShopProductsToSelectSucess extends ListLoadedState<ProductDto, int> {
  GetShopProductsToSelectSucess(super.data, {required super.selectedId});

  @override
  int getId(ProductDto element) {
    return element.id;
  }

  @override
  bool get isValid => selectedId != Constatnts.idEmpty;
}
