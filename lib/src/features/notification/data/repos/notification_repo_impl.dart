import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/model/paginated_list.dart';
import 'package:evievm_app/src/features/notification/data/data_sources/notification_data_source.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_overview_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/notification_repo.dart';

@LazySingleton(as: NotificationRepo)
class NotificationRepoImpl extends NotificationRepo {
  final NotificationDatasource datasource;

  NotificationRepoImpl(this.datasource);

  @override
  Future<Either<Failure, PaginatedList<NotificationModel>>> getNotifications(GetNotificationsModel param) async {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getNotifications(param),
      ),
    );
  }

  @override
  Future<Either<Failure, NotificationOverviewModel>> getNotificationOverview(GetNotificationsModel param) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getNotificationOverview(param),
      ),
    );
  }
}
