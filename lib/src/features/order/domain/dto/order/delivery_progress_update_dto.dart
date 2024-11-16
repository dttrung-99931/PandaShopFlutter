import 'package:equatable/equatable.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_progress_update_response.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_progress_dto.dart';

class DeliveryProgressUpdateDto extends Equatable {
  const DeliveryProgressUpdateDto({
    required this.id,
    required this.status,
    required this.progress,
  });
  final int id;
  final DeliveryStatus status;
  final DeliveryProgressDto progress;

  factory DeliveryProgressUpdateDto.fromModel(DeliveryProgressUpdateResponseModel model) {
    return DeliveryProgressUpdateDto(
      id: model.id,
      status: model.status,
      progress: DeliveryProgressDto.fromModel(model.progress),
    );
  }

  @override
  List<Object?> get props => [id, status, progress];
}
