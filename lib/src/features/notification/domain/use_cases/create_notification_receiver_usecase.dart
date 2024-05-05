import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/notification/data/models/request/notification_receiver_request_model.dart';
import 'package:evievm_app/src/features/notification/domain/repos/notification_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateNotificationReceiverUseCase extends EitherUseCase<dynamic, NotificationReceiverRequestModel> {
  final NotificationRepo _repo;

  CreateNotificationReceiverUseCase(this._repo);

  @override
  Future<Either<Failure, dynamic>> call(NotificationReceiverRequestModel param) async {
    return handleRepoResult(
      repoResult: _repo.createNotificationReceiver(param),
      onSuccess: (dynamic _) async {},
    );
  }
}
