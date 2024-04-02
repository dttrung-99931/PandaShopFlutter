import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';
import 'package:evievm_app/src/shared/dtos/image_dto.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/response/product_detail_model.dart';

class ProductDetailDto {
  final int id;
  final String name;
  final String description;
  final List<ImageDto> images;
  final List<PropertyValueDto> propertyValues;
  final List<ProductOptionDto> options;
  final int categoryId;

  // Map<propertyName, all values of options of property>
  Map<String, Set<String>> get optionProperties {
    Map<String, Set<String>> map = {};
    for (ProductOptionDto option in options) {
      for (PropertyValueDto prop in option.propertyValues) {
        map[prop.name] ??= {};
        map[prop.name]!.add(prop.value);
      }
    }
    return map;
  }

  Map<String, List<SelectableValueDto>> getAllSelectableValsOfProps() {
    return optionProperties.map(
      (String key, Set<String> values) => MapEntry(
        key,
        values
            .map((value) => SelectableValueDto(
                  value,
                  isSelectable: true,
                  isSelected: false,
                ))
            .toList(),
      ),
    );
  }

  // Map<propertyName, all selectable values of options of property>
  // Use to check a whether a property is selectable or not
  // Proeprty is selectable when there's an product option containing the property
  // Map<String, List<SelectableValueDto>> getSelectableValsOfProps(
  //   // Map<propertyName, selected value>
  //   Map<String, String> selectedProperties,
  //   {
  //     SelectableValueDto? changed,
  //   }
  // ) {
  //   return optionProperties.map(
  //     (String key, Set<String> values) => MapEntry(
  //       key,
  //       values
  //           .map(
  //             (value) => SelectableValueDto(value,
  //                 isSelectable: _existsOptionWithProeprtyValue(MapEntry(key, value), selectedProperties),
  //                 isSelected: selectedProperties[key] == value),
  //           )
  //           .toList(),
  //     ),
  //   );
  // }

  Map<String, List<SelectableValueDto>> getSelectableValsOfProps(
    // Map<propertyName, selected value>
    Map<String, String> selectedProperties, {
    SelectableValueDto? changed,
  }) {
    return optionProperties.map(
      (String key, Set<String> values) => MapEntry(
        key,
        values
            .map(
              (value) => SelectableValueDto(value,
                  isSelectable: _existsOptionWithProeprtyValue(MapEntry(key, value), selectedProperties),
                  isSelected: selectedProperties[key] == value),
            )
            .toList(),
      ),
    );
  }

  // Map<propertyName, selected value>
  bool _existsOptionWithProeprtyValue(MapEntry<String, String> propVal, Map<String, String> selectedPropVals) {
    // if prop is selected => an option was available with this prop before
    if (selectedPropVals[propVal.key] == propVal.value) return true;
    Map<String, String> processedSelectedVal = {...selectedPropVals};
    if (processedSelectedVal.containsKey(propVal.key)) {
      processedSelectedVal[propVal.key] = propVal.value;
    }
    return _existsOptionWithProeprtyValues(processedSelectedVal);
  }

  bool _existsOptionWithProeprtyValues(Map<String, String> propVals) {
    return options.any(
      (opt) => !propVals.entries.any(
        (propVal) => opt.propertyValuesMap.containsKey(propVal.key),
      ),
    );
  }

  ProductDetailDto({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.propertyValues,
    required this.options,
    required this.categoryId,
  });

  factory ProductDetailDto.fromModel(ProductDetailModel model) {
    return ProductDetailDto(
      id: model.id,
      name: model.name,
      description: model.description,
      images: model.images.map((e) => ImageDto.fromModel(e)).toList(),
      propertyValues: PropertyValueDto.fromList(model.propertyValues),
      options: ProductOptionDto.fromList(model.options),
      categoryId: model.categoryId,
    );
  }

  ProductOptionDto? findOption(Map<String, String> optionPropValMap) {
    return options.firstWhereOrNull((option) => mapEquals(optionPropValMap, option.propertyValuesMap));
  }
}

class SelectableValueDto {
  final String value;
  bool isSelectable;
  bool isSelected;

  SelectableValueDto(
    this.value, {
    required this.isSelectable,
    required this.isSelected,
  }); // selectable if there is a ProductOption containing the property
}

class PropertyValueDto {
  final int id;
  final String name;
  final String value;
  final int propertyId;

  PropertyValueDto({
    required this.id,
    required this.name,
    required this.value,
    required this.propertyId,
  });

  factory PropertyValueDto.fromModel(PropertyValueModel model) {
    return PropertyValueDto(
      id: model.id,
      name: model.name,
      value: model.value,
      propertyId: model.propertyId,
    );
  }

  static List<PropertyValueDto> fromList(List<PropertyValueModel> models) {
    return models.map((e) => PropertyValueDto.fromModel(e)).toList();
  }

  PropertyValuesDto toPropertyValues() {
    return PropertyValuesDto(
      propertyName: name,
      isRequired: false, // TODO:
      id: id,
      exampleValues: const [], // TODO:
      propertyId: propertyId,
    );
  }
}

class ProductOptionDto {
  final int id;
  final String? name;
  final List<PropertyValueDto> propertyValues;
  final double price;

  Map<String, String> get propertyValuesMap {
    Map<String, String> map = {};
    for (var propVal in propertyValues) {
      map[propVal.name] = propVal.value;
    }
    return map;
  }

  ProductOptionDto({
    required this.id,
    required this.name,
    required this.propertyValues,
    required this.price,
  });

  factory ProductOptionDto.fromModel(ProductOptionModel model) {
    return ProductOptionDto(
      id: model.id,
      name: model.name,
      propertyValues: PropertyValueDto.fromList(model.propertyValues),
      price: model.price,
    );
  }

  static List<ProductOptionDto> fromList(List<ProductOptionModel> models) {
    return models.map((e) => ProductOptionDto.fromModel(e)).toList();
  }
}
