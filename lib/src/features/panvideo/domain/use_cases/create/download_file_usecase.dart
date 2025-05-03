// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

@lazySingleton
class DownloadFileUseCase extends EitherUseCase<File, String> {
  DownloadFileUseCase();

  @override
  Future<Either<Failure, File>> call(String url) {
    return handleRepoResult(
      repoResult: executeWithTryCatch(
        () async {
          return DefaultCacheManager().getSingleFile(url);
        },
      ),
      onSuccess: (File file) async {
        return file;
      },
    );
  }
}
