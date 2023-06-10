part of 'search_products_bloc.dart';

class OnSearchProducts extends BaseEvent {
  final String q;

  OnSearchProducts(this.q);

  @override
  List<Object?> get props => [q];
}

class OnGetProducts extends BaseEvent {
  final String? q;
  final ProductCategoryDto? category;

  OnGetProducts({this.category, this.q});

  @override
  List<Object?> get props => [q];
}
