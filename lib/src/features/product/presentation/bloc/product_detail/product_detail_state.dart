// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_detail_bloc.dart';

class GetProductDetailSucess extends FullDataLoadedState<ProductDetailDto?> {
  GetProductDetailSucess(super.data);

  @override
  List<Object?> get props => [data];
}

class LoadingProducts extends LoadingState {}

class LoadingProductDetail extends LoadingState {}
