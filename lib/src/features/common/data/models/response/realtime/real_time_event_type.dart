// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

enum RealTimeEventType {
  @JsonValue(1)
  driverTakeDelivery,
  @JsonValue(4)
  deliveryProgreessUpdate,
}
