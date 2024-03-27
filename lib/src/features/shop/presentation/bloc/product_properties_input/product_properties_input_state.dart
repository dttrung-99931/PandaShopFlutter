// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'product_properties_input_bloc.dart';

// enum ProductPropAction {
//   addPropForOption,
//   none,
// }

class ProductPropsUpdated extends BaseState {
  ProductPropsUpdated(
    this.productProps, {
    required this.textControllerMap,
  });
  // Map<property id, text edt controller>
  final Map<int, TextEditingController> textControllerMap;
  final List<PropertyValuesDto> productProps;
  @override
  List<Object?> get props => [textControllerMap, productProps];
}
