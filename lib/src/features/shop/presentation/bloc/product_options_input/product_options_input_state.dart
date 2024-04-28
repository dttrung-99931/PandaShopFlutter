// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'product_options_input_bloc.dart';

class OptionPropsUpdated extends BaseState {
  OptionPropsUpdated(
    this.updatedOptionProps, {
    required this.propList,
    required this.propAction,
  });
  final List<PropertyValuesDto> updatedOptionProps;

  /// props that is updaed/delete/add into [updatedOptionProps]
  final List<PropertyValuesDto> propList;
  final EditAction propAction;

  @override
  List<Object?> get props => [updatedOptionProps, now.toString()];
}

class ProductOptionsUpdated extends FullDataLoadedState<List<ProductOptionInputDto>> {
  ProductOptionsUpdated(super.data, {this.selected, required this.editNameForSelected});
  final ProductOptionInputDto? selected;
  final bool editNameForSelected;
  @override
  List<Object?> get props => [super.props, selected];
}
