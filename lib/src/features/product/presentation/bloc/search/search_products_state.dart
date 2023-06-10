part of 'search_products_bloc.dart';

class SearchProductsSucess extends FullDataLoadedState<SearchProductDto> {
  final bool isSearchHistory;
  bool get isEmpty => !isSearchHistory && data.categories.isEmpty && data.products.isEmpty;

  SearchProductsSucess(super.data, {this.isSearchHistory = false});

  @override
  List<Object?> get props => [data];
}

class LoadingProducts extends LoadingState {}
