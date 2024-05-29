// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyTemplateModel _$PropertyTemplateModelFromJson(
        Map<String, dynamic> json) =>
    PropertyTemplateModel(
      id: (json['id'] as num).toInt(),
      properties: (json['properties'] as List<dynamic>)
          .map((e) => PropertyValuesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
