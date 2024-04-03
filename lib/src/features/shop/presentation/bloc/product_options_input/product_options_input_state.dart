// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'product_options_input_bloc.dart';

class OptionPropsUpdated extends BaseState {
  OptionPropsUpdated(
    this.updatedOptionProps, {
    required this.propAction,
    required this.propList,
  });
  final List<PropertyValuesDto> updatedOptionProps;
  final EditAction propAction;
  final List<PropertyValuesDto> propList;
  @override
  List<Object?> get props => [updatedOptionProps, now.toString()];
}

class ProductOptionsUpdated extends FullDataLoadedState<List<ProductOptionInputDto>> {
  ProductOptionsUpdated(super.data, {this.selected});
  final ProductOptionInputDto? selected;
  @override
  List<Object?> get props => [super.props, selected];
}
