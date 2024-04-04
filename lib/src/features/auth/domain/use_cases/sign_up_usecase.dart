// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_renaming_method_parameters
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/auth/data/models/request/sign_up_request_model.dart';
import 'package:evievm_app/src/features/auth/domain/repositories/auth_repo.dart';
import 'package:evievm_app/src/features/common/data/models/response/user/user_detail_model.dart';
import 'package:evievm_app/src/features/common/domain/dtos/user_detail_dto.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpUseCase extends EitherUseCase<UserDetailDto, SignUpRequestModel> {
  final AuthRepo _repo;

  SignUpUseCase(
    this._repo,
  );

  @override
  Future<Either<Failure, UserDetailDto>> call(SignUpRequestModel params) async {
    return handleRepoResult(
      repoResult: _repo.signUp(params),
      onSuccess: (UserDetailModel model) async {
        return UserDetailDto.fromModel(model);
      },
    );
  }
}
