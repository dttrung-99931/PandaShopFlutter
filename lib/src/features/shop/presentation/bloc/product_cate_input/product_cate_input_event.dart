// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_cate_input_bloc.dart';

class OnGetProductCates extends OnGetSelectData<int> {
  final int level;
  final int? parentId;
  OnGetProductCates({
    required this.level,
    this.parentId,
    super.selectedId,
  });

  @override
  List<Object?> get props => [level, parentId];
}

class OnProductCateSelected extends BaseEvent {
  final ProductCategoryDto selected;
  OnProductCateSelected({
    required this.selected,
  });
  @override
  List<Object?> get props => [selected];
}
