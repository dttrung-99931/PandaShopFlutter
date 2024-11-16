// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/common/data/models/response/realtime/real_time_event_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'real_time_event_model.g.dart';

@JsonSerializable(explicitToJson: false)
class RealTimeEventModel {
  final Map<String, dynamic> data;
  final RealTimeEventType type;

  RealTimeEventModel(
    this.data,
    this.type,
  );

  factory RealTimeEventModel.fromJson(Map<String, dynamic> json) => _$RealTimeEventModelFromJson(json);
}
