import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/common/data/models/response/user/user_detail_model.dart';

abstract class UserRepo extends BaseRepo {
  Future<Either<Failure, UserDetailModel>> getUserDetail();
}
