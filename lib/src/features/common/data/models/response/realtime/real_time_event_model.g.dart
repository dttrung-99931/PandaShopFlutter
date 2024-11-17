// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_time_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealTimeEventModel _$RealTimeEventModelFromJson(Map<String, dynamic> json) =>
    RealTimeEventModel(
      json['data'] as Map<String, dynamic>,
      $enumDecode(_$RealTimeEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$RealTimeEventModelToJson(RealTimeEventModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'type': _$RealTimeEventTypeEnumMap[instance.type]!,
    };

const _$RealTimeEventTypeEnumMap = {
  RealTimeEventType.driverTakeDelivery: 1,
  RealTimeEventType.deliveryProgreessUpdate: 4,
};
