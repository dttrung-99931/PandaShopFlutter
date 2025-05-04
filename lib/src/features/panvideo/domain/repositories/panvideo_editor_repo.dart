import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';

class EditPanvideoArgs {
  final File video;
  final File? integratedMusic;

  EditPanvideoArgs(this.video, {this.integratedMusic});
}

abstract class PanVideoEditorRepo extends BaseRepo {
  /// Edit video
  /// Returns the edited video file
  Future<Either<Failure, File>> editVideo(EditPanvideoArgs args);
}
