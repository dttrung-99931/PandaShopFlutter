// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_values_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyValuesModel _$PropertyValuesModelFromJson(Map<String, dynamic> json) => PropertyValuesModel(
      propertyName: json['propertyName'] as String,
      isRequired: json['isRequired'] as bool,
      id: json['id'] as int,
      exampleValues: (json['values'] as List<dynamic>).map((e) => e as String).toList(),
      propertyId: json['propertyId'] as int,
    );
