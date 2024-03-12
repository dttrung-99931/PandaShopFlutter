// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_option_bloc.dart';

class OptionSelectedChanged extends BaseState {
  final Map<String, List<SelectableValueDto>> selectablePropVals;
  final ProductOptionDto? selectedOption;

  OptionSelectedChanged({
    required this.selectablePropVals,
    required this.selectedOption,
  });

  @override
  List<Object?> get props => [
        selectablePropVals,
        selectedOption,
        now.toString(),
      ];
}
