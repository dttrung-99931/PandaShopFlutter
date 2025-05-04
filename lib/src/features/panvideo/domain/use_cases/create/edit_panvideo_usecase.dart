// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/panvideo/domain/repositories/panvideo_editor_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditPanVideoUsecase extends EitherUseCase<File, EditPanvideoArgs> {
  final PanVideoEditorRepo repo;

  EditPanVideoUsecase({
    required this.repo,
  });

  @override
  Future<Either<Failure, File>> call(EditPanvideoArgs param) {
    return handleRepoResult(
      repoResult: repo.editVideo(param),
      onSuccess: (File edited) async {
        return edited;
      },
    );
  }
}
