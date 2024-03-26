// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'product_properties_input_bloc.dart';

class GetPropTemplateSuccess extends FullDataLoadedState<PropertyTemplateDto> {
  GetPropTemplateSuccess(
    super.data, {
    required this.textControllerMap,
  });
  // Map<property id, text edt controller>
  final Map<int, TextEditingController> textControllerMap;
}
