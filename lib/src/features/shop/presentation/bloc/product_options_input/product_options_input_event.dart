// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_options_input_bloc.dart';

class OnAddPropertyForOption extends BaseEvent {
  final PropertyValuesDto prop;
  OnAddPropertyForOption({
    required this.prop,
  });
  @override
  List<Object?> get props => [prop];
}

class OnRemovePropertyForOption extends BaseEvent {
  final PropertyValuesDto prop;
  OnRemovePropertyForOption({
    required this.prop,
  });
  @override
  List<Object?> get props => [prop];
}

class OnAddProductOption extends BaseEventWithoutProps {}

class OnDeleteProductOption extends BaseEvent {
  final int productOptionId;
  OnDeleteProductOption({
    required this.productOptionId,
  });
  @override
  List<Object?> get props => [productOptionId];
}

class OnSelectProductOption extends OnSelect<ProductOptionInputDto> {
  OnSelectProductOption({required super.selected, this.editNameForSelected = false});
  final bool editNameForSelected;
}

class OnInitProductOptions extends BaseEvent {
  final List<ProductOptionDto> options;
  OnInitProductOptions({
    required this.options,
  });
  @override
  List<Object?> get props => [options];
}
