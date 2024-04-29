import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';
import 'package:evievm_app/core/utils/storage.dart';
import 'package:evievm_app/global.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogoutUseCase extends EitherUseCase<void, NoParams> {
  final Storage _storage;

  LogoutUseCase(this._storage);

  @override
  Future<Either<Failure, void>> call(NoParams param) async {
    return executeWithTryCatch(() async {
      await _storage.deleteAll();
      Global.mainPageIndexNotifier = ValueNotifier(0);
    });
  }
}
