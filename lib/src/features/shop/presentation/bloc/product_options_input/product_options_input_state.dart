// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'product_options_input_bloc.dart';

class OptionPropsUpdated extends BaseState {
  OptionPropsUpdated(
    this.optionProps, {
    required this.propAction,
    required this.prop,
  });
  final List<PropertyValuesDto> optionProps;
  final EditAction propAction;
  final PropertyValuesDto prop;
  @override
  List<Object?> get props => [optionProps, now.toString()];
}

class ProductOptionsUpdated extends FullDataLoadedState<List<ProductOptionInputDto>> {
  ProductOptionsUpdated(super.data, {this.selected});
  final ProductOptionInputDto? selected;
}
