// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_properties_input_bloc.dart';

class OnGetPropertyTemplateOfCate extends BaseEvent {
  final int cateId;
  OnGetPropertyTemplateOfCate({
    required this.cateId,
  });
  @override
  List<Object?> get props => [cateId];
}

class OnOptionPropsUpdated extends BaseEvent {
  final OptionPropsUpdated optionPropUpdated;
  OnOptionPropsUpdated({
    required this.optionPropUpdated,
  });

  @override
  List<Object?> get props => [optionPropUpdated];
}

class OnFillInPropertyValues extends BaseEvent {
  final List<PropertyValueDto> propValues;
  OnFillInPropertyValues({
    required this.propValues,
  });

  @override
  List<Object?> get props => [propValues];
}
