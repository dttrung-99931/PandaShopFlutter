// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shop_product_detail_bloc.dart';

// class GetProductDetailSucess extends FullDataLoadedState<ProductDetailDto?> {
//   final int? selectedOptionId;
//   GetProductDetailSucess(super.data, {this.selectedOptionId});

//   @override
//   List<Object?> get props => [data, selectedOptionId];
// }

// class LoadingProducts extends LoadingState {}

class InitShopProductSuccess extends LoadingCompleteState {
  final ProductDetailDto? productDetail;
  InitShopProductSuccess({
    this.productDetail,
  });
  @override
  List<Object?> get props => [productDetail];
}

class CreateProductSuccess extends LoadingCompleteState {
  final ProductDto product;
  CreateProductSuccess({
    required this.product,
  });
  @override
  List<Object?> get props => [product];
}

class UpdateProductSuccess extends LoadingCompleteStateWithoutProps {}

class CreateProductError extends ErrorState {
  CreateProductError(super.failure);
}

class UpdateProductError extends ErrorState {
  UpdateProductError(super.failure);
}
