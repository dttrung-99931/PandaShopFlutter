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
  bool get isValid => selectedId != Constants.idEmpty;
}

class CreateWarehouseSuccess extends FullDataLoadedState<WarehouseDto> {
  CreateWarehouseSuccess(super.data);
}

class CreateProductInventorySuccess extends LoadingCompleteStateWithoutProps {}

class CreateWarehouseInputSuccess extends FullDataLoadedState<WarehouseInputDto> {
  CreateWarehouseInputSuccess(super.data);
}

class GetWarehousesSuccess extends ListLoadedState<WarehouseDto, int> {
  GetWarehousesSuccess(
    super.data, {
    required super.selectedId,
  });
  @override
  int getId(WarehouseDto element) {
    return element.id ?? Constants.idEmpty;
  }

  @override
  bool get isValid => selectedId != Constants.idEmpty;
}

class CreateProductInventoryError extends ErrorState {
  CreateProductInventoryError(super.failure);
}
