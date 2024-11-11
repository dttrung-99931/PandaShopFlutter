import 'package:evievm_app/src/features/order/data/models/response/order/delivery_progress_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_progress_update_response.g.dart';

@JsonSerializable(createToJson: false)
class DeliveryProgressUpdateResponseModel {
  final int id;
  final DeliveryStatus status;
  final DeliveryProgressResponseModel progress;

  DeliveryProgressUpdateResponseModel({
    required this.id,
    required this.status,
    required this.progress,
  });

  factory DeliveryProgressUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryProgressUpdateResponseModelFromJson(json);
}
