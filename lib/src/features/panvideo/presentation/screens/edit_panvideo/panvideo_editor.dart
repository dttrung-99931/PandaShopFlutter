import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/edit_panvideo_result_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/edit_panvideo/creative_editer/creative_panvideo_editor.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/edit_panvideo/custom_editor/custom_panvideo_editor.dart';

class EditPanvideoArgs extends Equatable {
  final String videoPath;

  const EditPanvideoArgs(this.videoPath);

  @override
  List<Object?> get props => [videoPath];
}

abstract class PanvideoEditor {
  // Edit video
  // Return editted video File
  Future<EditPanvideoResultDto?> editVdieo(EditPanvideoArgs args);
}

enum PanvideoEditerType {
  creative, // img.ly sdk
  custom // customized
}

class PanvideoEditorFactory {
  static PanvideoEditor getEditor(PanvideoEditerType type) {
    switch (type) {
      case PanvideoEditerType.creative:
        return getIt<CreativePanvideoEditor>();
      case PanvideoEditerType.custom:
        return getIt<CustomPanvideoEditor>();
    }
  }
}
