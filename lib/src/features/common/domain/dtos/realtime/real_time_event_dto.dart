// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/common/data/models/response/realtime/real_time_event_model.dart';
import 'package:evievm_app/src/features/common/data/models/response/realtime/real_time_event_type.dart';

class RealTimeEventDto {
  final dynamic data;
  final RealTimeEventType type;

  RealTimeEventDto({required this.data, required this.type});

  factory RealTimeEventDto.fromModel(RealTimeEventModel model) {
    return RealTimeEventDto(data: model.data, type: model.type);
  }
}
