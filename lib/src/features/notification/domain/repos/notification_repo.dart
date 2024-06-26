import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/model/paginated_list.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/data/models/request/notification_receiver_request_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_overview_model.dart';

abstract class NotificationRepo extends BaseRepo {
  Future<Either<Failure, PaginatedList<NotificationModel>>> getNotifications(GetNotificationsModel param);
  Future<Either<Failure, NotificationOverviewModel>> getNotificationOverview(GetNotificationsModel param);
  Future<Either<Failure, dynamic>> createNotificationReceiver(NotificationReceiverRequestModel param);
}
