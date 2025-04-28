// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/edit_panvideo_result_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/edit_panvideo/panvideo_editor.dart';
import 'package:injectable/injectable.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

@injectable
class CreativePanvideoEditor extends PanvideoEditor {
  @override
  Future<EditPanvideoResultDto?> editVdieo(EditPanvideoArgs args) async {
    final video = Video(args.videoPath);
    final VideoEditorResult? editted = await VESDK.openEditor(video);
    final edittedVideo = editted?.video != null ? File(editted!.video) : null;
    return EditPanvideoResultDto(
      video: edittedVideo,
      title: 'Video title $now',
      durationInSecs: 120,
      description: 'Video title $now',
    );
  }
}
