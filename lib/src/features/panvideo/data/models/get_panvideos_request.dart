import 'package:json_annotation/json_annotation.dart';

part 'get_panvideos_request.g.dart';

@JsonSerializable(includeIfNull: false, createFactory: false)
class GetPanvideosRequest {
  final String? q;

  GetPanvideosRequest({
    this.q,
  });

  Map<String, dynamic> toJson() => _$GetPanvideosRequestToJson(this);
}
