// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/model/paginated_request.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_notifications_model.g.dart';

@JsonSerializable(createFactory: false)
class GetNotificationsModel extends PaginatedRequest {
  GetNotificationsModel({
    super.pageSize,
    super.pageNum,
    this.status,
    this.onlyForShop,
  });
  final OrderStatus? status;
  final bool? onlyForShop;

  Map<String, dynamic> toJson() => _$GetNotificationsModelToJson(this);
}
