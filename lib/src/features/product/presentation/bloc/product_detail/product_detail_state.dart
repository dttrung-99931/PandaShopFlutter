// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_detail_bloc.dart';

class GetProductDetailSucess extends FullDataLoadedState<ProductDetailDto?> {
  GetProductDetailSucess(super.data);

  @override
  List<Object?> get props => [data];
}

class OptionPropSelectedChanged extends BaseState {
  final Map<String, List<SelectableValueDto>> selectablePropVals;
  final ProductOptionDto? selectedOption;

  OptionPropSelectedChanged({
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

class LoadingProducts extends LoadingState {}
