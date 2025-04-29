import 'package:json_annotation/json_annotation.dart';

part 'get_panmusics_request.g.dart';

@JsonSerializable(includeIfNull: false, createFactory: false)
class GetPanMusicsRequest {
  final String? q;

  GetPanMusicsRequest({
    this.q,
  });

  Map<String, dynamic> toJson() => _$GetPanMusicsRequestToJson(this);
}
