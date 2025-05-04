import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/src/features/panvideo/domain/repositories/panvideo_editor_repo.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_session.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PanVideoEditorRepo)
class FFmpegPanvideoEditorRepoImpl extends PanVideoEditorRepo {
  @override
  Future<Either<Failure, File>> editVideo(EditPanvideoArgs args) async {
    if (args.integratedMusic == null) {
      return Right(args.video);
    }

    String outputPath = args.video.path.replaceAll('.mp4', '_edited.mp4');
    // String commands = _buildEditVideoFfmpegCommands(args, outputPath);
    final ffmpegArgs = _buildEditVideoFfmpegArgs(args, outputPath);
    final FFmpegSession res = await FFmpegKit.executeWithArguments(ffmpegArgs);
    final ReturnCode? returnCode = await res.getReturnCode();
    if (ReturnCode.isSuccess(returnCode)) {
      res.getOutput().then((value) {
        logd('FFmpeg logs: $value');
      });
      return Right(File(outputPath));
    } else {
      res.getOutput().then((value) {
        logd('Failed to edit video using ffmpeg: \n$value');
      });
      return Left(Failure('Failed to edit video'));
    }
  }

  List<String> _buildEditVideoFfmpegArgs(EditPanvideoArgs args, String outputPath) {
    return [
      '-i',
      args.video.path,
      '-i',
      args.integratedMusic!.path,
      '-map',
      '0:v:0',
      '-map',
      '1:a:0',
      '-c:v',
      'copy',
      '-c:a',
      'aac',
      '-shortest',
      '-y',
      outputPath,
    ];
  }

  String _buildEditVideoFfmpegCommands(EditPanvideoArgs args, String outputPath) {
    // -i ${args.video.path} -i ${args.integratedMusic?.path} -c:v copy -c:a aac -strict experimental -shortest $outputPath
    return '-i ${args.video.path} -i ${args.integratedMusic!.path} -map 0:v:0 -map 1:a:0  -c:v copy -c:a copy -shortest $outputPath';
  }
}
