import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/notification_dto.dart';
import 'package:evievm_app/src/features/notification/domain/repos/notification_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetNotificationsUseCase extends EitherUseCase<List<NotificationDto>, GetNotificationsModel> {
  final NotificationRepo _repo;

  GetNotificationsUseCase(this._repo);

  @override
  Future<Either<Failure, List<NotificationDto>>> call(GetNotificationsModel param) async {
    return handleRepoResult(
      repoResult: _repo.getNotifications(param),
      onSuccess: (List<NotificationModel> model) async {
        return model.map((e) => NotificationDto.fromModel(e)).toList();
      },
    );
  }
}
