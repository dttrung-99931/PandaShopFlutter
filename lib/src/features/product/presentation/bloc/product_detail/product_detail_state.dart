part of 'product_detail_bloc.dart';

class GetProductDetailSucess extends FullDataLoadedState<ProductDetailDto?> {
  GetProductDetailSucess(super.data);

  @override
  List<Object?> get props => [data];
}

class LoadingProducts extends LoadingState {}
