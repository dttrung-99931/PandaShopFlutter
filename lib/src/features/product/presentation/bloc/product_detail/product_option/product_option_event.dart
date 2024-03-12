// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_option_bloc.dart';

class OnOptionPropSelectedChagned extends BaseEvent {
  final String propertyName;
  final String value;
  final bool isSelected;

  OnOptionPropSelectedChagned({
    required this.propertyName,
    required this.value,
    required this.isSelected,
  });

  @override
  List<Object?> get props => [propertyName, value, isSelected];
}

class OnInitProductOption extends BaseEvent {
  final ProductDetailDto productDetail;
  OnInitProductOption({
    required this.productDetail,
  });

  @override
  List<Object?> get props => [productDetail];
}
