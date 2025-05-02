import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/panvideo/domain/repositories/panvideo_editor_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PanVideoEditorRepo)
class PanvideoEditorRepoImpl extends PanVideoEditorRepo {
  @override
  Future<Either<Failure, File>> editVideo(EditPanvideoArgs args) {
    throw UnimplementedError('editVideo is not implemented');
    // return handleNetwork(
    //   onRemote: handleServerErrors(
    //     datasourceResponse: _datasource.getMyPanMusics(request),
    //   ),
    // );
  }
}
