import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/log.dart';

import '../failures/failures.dart';
import '../model/base_response.dart';
import '../utils/error_handlers.dart';
import '../utils/network_utils.dart';

abstract class BaseRepo {
  /// Execute [onRemote] if network is available, otherwise [onLocal] and return either result;
  /// Handle either errors
  Future<Either<Failure, T>> handleNetwork<T>({
    required Future<Either<Failure, T>> onRemote,
    Future<Either<Failure, T>>? onLocal,
  }) async {
    bool isConnected = await NetworkUtils.isConnected;
    if (!isConnected && onLocal == null) {
      return Left(NetworkFailure()..log());
    }
    Either<Failure, Either<Failure, T>> result = await executeWithTryCatch(() async {
      return await (isConnected ? onRemote : onLocal!);
    });
    return result.fold((Failure l) => Left(l..log()), (Either<Failure, T> r) => r);
  }

  Future<Either<Failure, T>> handleServerErrors<T>({
    required Future<BaseResponse<T?>> datasourceResponse,
  }) async {
    try {
      BaseResponse<T?> response = await datasourceResponse;
      if (response.success) {
        return Right(response.data as T);
      }

      return Left(
        ServerError(
          msg: response.message ?? '',
          statusCode: response.statusCode,
        )..log(),
      );
    } on DioError catch (e) {
      loge('$e\n${e.response?.data}');
      if (e.error is SocketException) {
        return Left(NetworkFailure());
      }
      if (e.error is HandshakeException) {
        return Left(
          ServerError(
            msg: 'Không thể kết nối đến server',
            statusCode: e.response?.statusCode ?? 0,
          )..log(),
        );
      }
      return Left(
        ServerError(
          msg: e.response?.data['message'] ?? '',
          statusCode: e.response?.statusCode ?? 0,
        )..log(),
      );
    } catch (e) {
      loge(e.toString());
      return Left(
        UnexpectedFailure()..log(moreDetailedStackTrace: e is TypeError ? e.stackTrace : null),
      );
    }
  }
}
