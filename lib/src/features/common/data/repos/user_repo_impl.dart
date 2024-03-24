import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/common/data/data_sources/user_data_source.dart';
import 'package:evievm_app/src/features/common/data/models/response/user/user_detail_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/user_repo.dart';

@LazySingleton(as: UserRepo)
class UserRepoImpl extends UserRepo {
  final UserDatasource datasource;

  UserRepoImpl(this.datasource);

  @override
  Future<Either<Failure, UserDetailModel>> getUserDetail() {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getUserDetail(),
      ),
    );
  }
}
