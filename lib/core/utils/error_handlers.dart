import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';

import 'log.dart';

/// Try catch and return error if error occuring
/// Return Either<Failure, T // success result>
Future<Either<Failure, T>> executeWithTryCatch<T>(
  Future<T> Function() action, {
  Failure Function(dynamic error) errorHandler = handleError,
}) async {
  try {
    T result = await action();
    return Right(result);
  } catch (e) {
    return Left(errorHandler(e));
  }
}

/// Try catch and log. Continuely rethrow errors
///
/// Return Either<Failure, T // success result>
Future<T> tryCatchLog<T>(Future<T> Function() action) async {
  try {
    return await action();
  } catch (e) {
    loge(e);
    rethrow;
  }
}

/// Handle errors
Failure handleError(dynamic error) {
  return Failure(error?.toString() ?? 'Unkown error');
}
