// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'product_cate_input_bloc.dart';

class GetProductCatesSelectSucess extends ListLoadedState<ProductCategoryDto, int> {
  GetProductCatesSelectSucess(super.data, {required super.selectedId});

  factory GetProductCatesSelectSucess.factory({
    required int level,
    required List<ProductCategoryDto> data,
    int selectedId = Constatnts.idEmpty,
  }) {
    switch (level) {
      case 1:
        return GetProductCatesLv1Successs([ProductCategoryDto.emptyLv1, ...data], selectedId: selectedId);
      case 2:
        return GetProductCatesLv2Successs([ProductCategoryDto.emptyLv2, ...data], selectedId: selectedId);
      case 3:
        return GetProductCatesLv3Successs([ProductCategoryDto.emptyLv3, ...data], selectedId: selectedId);
    }
    throw 'Invalid cate level';
  }

  @override
  int getId(ProductCategoryDto element) {
    return element.id;
  }

  @override
  bool get isValid => selectedId != Constatnts.idEmpty;
}

class GetProductCatesLv1Successs extends GetProductCatesSelectSucess {
  GetProductCatesLv1Successs(super.data, {required super.selectedId});
}

class GetProductCatesLv2Successs extends GetProductCatesSelectSucess {
  GetProductCatesLv2Successs(super.data, {required super.selectedId});
}

class GetProductCatesLv3Successs extends GetProductCatesSelectSucess {
  GetProductCatesLv3Successs(super.data, {required super.selectedId});
}
