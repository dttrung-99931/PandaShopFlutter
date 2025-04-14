// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/data/models/create_panvideo_request.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/create_video_response_dto.dart';
import 'package:evievm_app/src/features/panvideo/domain/use_cases/create_panvideo_usecase.dart';
import 'package:evievm_app/src/features/panvideo/domain/use_cases/gen_thumbnail_image_usecase.dart';
import 'package:injectable/injectable.dart';

part 'create_panvideo_event.dart';
part 'create_panvideo_state.dart';

CreatePanVideoBloc get createPanVideoBloc => getIt<CreatePanVideoBloc>();

@lazySingleton
class CreatePanVideoBloc extends BaseBloc {
  final CreatePanvideoUsecase _createPanvideo;
  final GenThumbnailImageUsecase _genThumbImage;

  CreatePanVideoBloc(this._createPanvideo, this._genThumbImage) : super(InitialState()) {
    onLoad<OnCreatePanvideo>(_onCreatePanvideo);
  }

  Future<void> _onCreatePanvideo(OnCreatePanvideo event, Emitter<BaseState> emit) async {
    File? thumbImage = await handleUsecaseResult(
      usecaseResult: _genThumbImage.call(event.video),
      emit: emit.call,
      onError: (failure) {
        logd(failure.msg);
        return ErrorState(failure);
      },
    );

    if (thumbImage == null) {
      return;
    }

    await handleUsecaseResult(
      usecaseResult: _createPanvideo.call(
        CreatePanvideoRequest(
          video: event.video,
          thumbnailImage: thumbImage,
          title: event.title,
          durationInSecs: event.durationInSecs,
          description: event.description,
        ),
      ),
      emit: emit.call,
      onSuccess: (CreatePanvideoResponseDto result) {
        // Remove thumbimage, video from local
        thumbImage.delete();
        event.video.delete();
        return CreatePanvideoSuccess(result);
      },
    );
  }
}
