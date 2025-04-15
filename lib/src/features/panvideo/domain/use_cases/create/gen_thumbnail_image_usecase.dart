// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/panvideo/domain/repositories/panvideo_repo.dart';
import 'package:injectable/injectable.dart';

/// Gen a thumbnail iamge from input video File
/// Return the thumbnail image File
@lazySingleton
class GenThumbnailImageUsecase extends EitherUseCase<File, File> {
  final PanvideoRepo repo;

  GenThumbnailImageUsecase({
    required this.repo,
  });

  @override
  Future<Either<Failure, File>> call(File video) {
    return handleRepoResult(
      repoResult: repo.genThumbnailImage(video),
      onSuccess: (File thumbnail) async {
        return thumbnail;
      },
    );
  }
}
