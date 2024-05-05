import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/data/models/request/notification_receiver_request_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_overview_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'notification_data_source.g.dart';

@module
abstract class NotificationDatasourceProvider {
  @singleton
  NotificationDatasource provideNotificationDatasource(Dio dio) {
    return _NotificationDatasource(dio);
  }
}

@RestApi()
abstract class NotificationDatasource {
  @GET('/v1/Notifications')
  Future<PaginatedListResponse<NotificationModel>> getNotifications(@Queries() GetNotificationsModel params);

  @GET('/v1/Notifications/Overview')
  Future<BaseResponse<NotificationOverviewModel>> getNotificationOverview(@Queries() GetNotificationsModel params);

  @POST('/v1/Notifications/Receiver')
  Future<BaseResponse> createNotificationReceiver(@Body() NotificationReceiverRequestModel param);
}
