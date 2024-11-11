// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_progress_update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryProgressUpdateResponseModel
    _$DeliveryProgressUpdateResponseModelFromJson(Map<String, dynamic> json) =>
        DeliveryProgressUpdateResponseModel(
          id: (json['id'] as num).toInt(),
          status: $enumDecode(_$DeliveryStatusEnumMap, json['status']),
          progress: DeliveryProgressResponseModel.fromJson(
              json['progress'] as Map<String, dynamic>),
        );

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.created: 1,
  DeliveryStatus.findingDriver: 4,
  DeliveryStatus.foundDriver: 6,
  DeliveryStatus.movingToShop: 8,
  DeliveryStatus.receivingProduct: 12,
  DeliveryStatus.delivering: 16,
  DeliveryStatus.delivered: 20,
  DeliveryStatus.cancelled: 24,
  DeliveryStatus.lose: 28,
  DeliveryStatus.productBroken: 32,
};
