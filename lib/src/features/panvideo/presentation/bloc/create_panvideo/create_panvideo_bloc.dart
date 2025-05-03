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
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:evievm_app/src/features/panvideo/domain/use_cases/create/create_panvideo_usecase.dart';
import 'package:evievm_app/src/features/panvideo/domain/use_cases/create/gen_thumbnail_image_usecase.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/panvideo_duration.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panmusic/player/panmusic_player.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'create_panvideo_event.dart';
part 'create_panvideo_state.dart';

CreatePanVideoBloc get createPanVideoBloc => getIt<CreatePanVideoBloc>();

@lazySingleton
class CreatePanVideoBloc extends BaseBloc {
  CreatePanVideoBloc(
    this._createPanvideo,
    this._genThumbImage,
    this._panMusicPlayer,
  ) : super(InitialState()) {
    onLoad<OnCreatePanvideo>(_onCreatePanvideo);
    on<OnPanMusicSelected>(_onPanMusicSelected);
    on<OnStartRecording>(_onStartRecording);
    on<OnRecordingComplete>(_onCompleteRecording);
    on<OnCompletingRecording>(_onCompletingRecording);
    on<OnPauseRecording>(_onPauseRecording);
    on<OnResumeRecording>(_onResumeRecording);
  }
  final CreatePanvideoUsecase _createPanvideo;
  final GenThumbnailImageUsecase _genThumbImage;

  final PanMusicPlayer _panMusicPlayer;

  PanMusicDto? _selectedMusic;
  PanMusicDto? get selectedMusic => _selectedMusic;

  Future<void> _onStartRecording(OnStartRecording event, Emitter<BaseState> emit) async {
    if (_selectedMusic != null) {
      _panMusicPlayer.play(_selectedMusic!, resetPlayingMusic: true);
    }
    emit(PanvideoRecordingStarted(event.duration));
  }

  Future<void> _onCompleteRecording(OnRecordingComplete event, Emitter<BaseState> emit) async {
    if (_selectedMusic != null) {
      await _panMusicPlayer.pause();
    }
    emit(PanvideoRecordingComplete(event.videoPath));
  }

  Future<void> _onCompletingRecording(OnCompletingRecording event, Emitter<BaseState> emit) async {
    emit(PanvideoCompletingRecording());
  }

  Future<void> _onPauseRecording(OnPauseRecording event, Emitter<BaseState> emit) async {
    emit(PanvideoRecordingPaused());
    if (_selectedMusic != null) {
      _panMusicPlayer.pause();
    }
  }

  Future<void> _onResumeRecording(OnResumeRecording event, Emitter<BaseState> emit) async {
    emit(PanvideoRecordingResumed());
    if (_selectedMusic != null) {
      _panMusicPlayer.play(_selectedMusic!);
    }
  }

  Future<void> _onPanMusicSelected(OnPanMusicSelected event, Emitter<BaseState> emit) async {
    if (_selectedMusic == event.music) {
      return;
    }
    _selectedMusic = event.music;
    emit(PanMusicSelected(event.music));
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

  @override
  @mustCallSuper
  @disposeMethod
  Future<void> close() async {
    // Remove recorded video files
    List<BaseState> videoCompleteStates = await stream.where((state) => state is PanvideoRecordingComplete).toList();
    for (var state in videoCompleteStates) {
      if (state is PanvideoRecordingComplete) {
        File(state.videoPath).delete();
      }
    }
    return super.close();
  }
}
