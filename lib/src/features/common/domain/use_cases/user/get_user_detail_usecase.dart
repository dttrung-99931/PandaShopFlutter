import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/common/data/models/response/user/user_detail_model.dart';
import 'package:evievm_app/src/features/common/domain/dtos/user_detail_dto.dart';
import 'package:evievm_app/src/features/common/domain/repos/user_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserDetailUseCase extends EitherUseCase<UserDetailDto, NoParams> {
  final UserRepo _repo;

  GetUserDetailUseCase(this._repo);

  @override
  Future<Either<Failure, UserDetailDto>> call(NoParams param) async {
    return handleRepoResult(
      repoResult: _repo.getUserDetail(),
      onSuccess: (UserDetailModel model) async {
        return UserDetailDto.fromModel(model);
      },
    );
  }
}
