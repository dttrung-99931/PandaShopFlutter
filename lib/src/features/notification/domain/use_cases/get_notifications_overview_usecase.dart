import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_overview_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/notification_overview_dto.dart';
import 'package:evievm_app/src/features/notification/domain/repos/notification_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetNotificationOverviewUseCase extends EitherUseCase<NotificationOverviewDto, GetNotificationsModel> {
  final NotificationRepo _repo;

  GetNotificationOverviewUseCase(this._repo);

  @override
  Future<Either<Failure, NotificationOverviewDto>> call(GetNotificationsModel param) async {
    return handleRepoResult(
      repoResult: _repo.getNotificationOverview(param),
      onSuccess: (NotificationOverviewModel model) async {
        return NotificationOverviewDto.fromModel(model);
      },
    );
  }
}
