import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/auth/data/models/request/login_request_model.dart';
import 'package:evievm_app/src/features/auth/data/models/response/login_response_model.dart';

abstract class AuthRepo extends BaseRepo {
  // Future<Either<Failure, LoginResponseModel>> login(LoginRequestModel param);
}
