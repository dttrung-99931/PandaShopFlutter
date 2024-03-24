import 'package:evievm_app/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:evievm_app/src/features/auth/data/models/request/login_request_model.dart';
import 'package:evievm_app/src/features/auth/data/models/request/qr_barcode_request_model.dart';
import 'package:evievm_app/src/features/auth/data/models/response/login_response_model.dart';
import 'package:evievm_app/src/features/auth/data/models/response/user_profile_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/shop_repo.dart';
import '../data_sources/shop_remote_data_soruce.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final ShopRemoteDatasource datasource;

  AuthRepoImpl(this.datasource);
}
