// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_payload.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/notification_overview_dto.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/model/paginated_list.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/notification_dto.dart';
import 'package:evievm_app/src/features/notification/domain/use_cases/get_notifications_overview_usecase.dart';
import 'package:evievm_app/src/features/notification/domain/use_cases/get_notifications_usecase.dart';

part 'notification_event.dart';
part 'notification_state.dart';

NotificationBloc get notiBloc => getIt();

@lazySingleton
class NotificationBloc extends BaseBloc {
  NotificationBloc(
    this._getNotis,
    this._getNotiOverview,
  ) : super(InitialState()) {
    onLoad<OnGetNotifications>(_onGetNotifications);
    on<OnGetNotificationOverview>(_onGetNotificationOverview);
  }
  final GetNotificationsUseCase _getNotis;
  final GetNotificationOverviewUseCase _getNotiOverview;

  FutureOr<void> _onGetNotifications(OnGetNotifications event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getNotis.call(event.requestModel),
      emit: emit,
      onSuccess: (PaginatedList<NotificationDto> result) {
        return GetNotificationsSuccesss(result);
      },
    );
  }

  FutureOr<void> _onGetNotificationOverview(OnGetNotificationOverview event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getNotiOverview.call(event.requestModel),
      emit: emit,
      onSuccess: (NotificationOverviewDto result) {
        return GetNotificationOverviewSuccesss(result);
      },
    );
  }
}
