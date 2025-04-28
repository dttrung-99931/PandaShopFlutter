// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/bloc_concurrency.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/data/models/create_panvideo_request.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/create_video_response_dto.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/edit_panvideo_result_dto.dart';
import 'package:evievm_app/src/features/panvideo/domain/use_cases/create/create_panvideo_usecase.dart';
import 'package:evievm_app/src/features/panvideo/domain/use_cases/create/edit_panvideo_usecase.dart';
import 'package:evievm_app/src/features/panvideo/domain/use_cases/create/gen_thumbnail_image_usecase.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/edit_panvideo/panvideo_editor.dart';
import 'package:injectable/injectable.dart';

part 'create_panvideo_event.dart';
part 'create_panvideo_state.dart';

CreatePanVideoBloc get createPanVideoBloc => getIt<CreatePanVideoBloc>();

@lazySingleton
class CreatePanVideoBloc extends BaseBloc {
  final CreatePanvideoUsecase _createPanvideo;
  final GenThumbnailImageUsecase _genThumbImage;
  final EditPanvideoUsecase _editPanvideo;

  CreatePanVideoBloc(this._createPanvideo, this._genThumbImage, this._editPanvideo) : super(InitialState()) {
    onLoad<OnCreatePanvideo>(_onCreatePanvideo, transformer: BlocConcurrency.droppable());
    onLoad<OnEditPanvideo>(
      _onEditPanvideo,
      transformer: BlocConcurrency.droppable(),
      loadingBuilder: (event) => EditingPanvideo(args: event.args),
    );
  }

  Future<void> _onCreatePanvideo(OnCreatePanvideo event, Emitter<BaseState> emit) async {
    final EditPanvideoResultDto panvideo = event.panvideo;
    assert(panvideo.video != null, 'Video not provided');

    File? thumbImage = await handleUsecaseResult(
      usecaseResult: _genThumbImage.call(panvideo.video!),
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
          video: panvideo.video!,
          thumbnailImage: thumbImage,
          title: panvideo.title,
          durationInSecs: panvideo.durationInSecs,
          description: panvideo.description,
        ),
      ),
      emit: emit.call,
      onSuccess: (CreatePanvideoResponseDto result) {
        // Remove thumbimage, video from local
        thumbImage.delete();
        panvideo.video?.delete();
        return CreatePanvideoSuccess(result);
      },
    );
  }

  Future<void> _onEditPanvideo(OnEditPanvideo event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _editPanvideo.call(event.args),
      emit: emit.call,
      onSuccess: (EditPanvideoResultDto? edittedVideo) {
        return EditPanvideoSuccess(panvideo: edittedVideo);
      },
    );
  }
}
