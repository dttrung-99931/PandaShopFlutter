// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:evievm_app/src/features/panvideo/domain/repositories/panvideo_editor_repo.dart';
import 'package:evievm_app/src/features/panvideo/domain/use_cases/create/download_file_usecase.dart';
import 'package:evievm_app/src/features/panvideo/domain/use_cases/create/edit_panvideo_usecase.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panmusic/player/panmusic_player.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:panda_map/widgets/disposable_mixin.dart';

part 'edit_panvideo_event.dart';
part 'edit_panvideo_state.dart';

EditPanVideoBloc get editPanVideoBloc => getIt<EditPanVideoBloc>();

@lazySingleton
class EditPanVideoBloc extends PanvideoManagerBloc with DisposableMixin {
  final PanMusicPlayer _panMusicPlayer;
  final EditPanVideoUsecase _editPanvideo;
  final DownloadFileUseCase _downloadFile;
  PanMusicDto? _panMusic;
  late File _panvideo;

  final List<File> _editedVideos = [];

  /// Remove communication of parent which is used for panvideo feed feature
  /// TODO: make PanvideoManagerBloc abstract class,
  /// create separated FeedPanvideoManagerBloc for feed
  @override
  BlocCommunication? get blocCommunication => null;

  EditPanVideoBloc(
    this._panMusicPlayer,
    super.panvideoManager,
    this._editPanvideo,
    this._downloadFile,
  ) : super() {
    on<OnInitPanvideoEdit>(_onInitPanvideoEdit);
    onLoad<OnEditPanvideo>(
      _onEidtPanVideo,
      loadingBuilder: (_) => LoadingEditPanvideo(),
    );
  }

  Future<void> _onInitPanvideoEdit(OnInitPanvideoEdit event, Emitter<BaseState> emit) async {
    if (event.panMusic != null) {
      await _onInitPanMusic(event.panMusic!);
    }
    _panvideo = File(event.videoPath);
    add(OnSetPanvideoDatasources(
      datasources: [
        VideoDatasource(
          BetterPlayerDataSourceType.file,
          event.videoPath,
          thumbImageUrl: '',
        ),
      ],
    ));
    add(OnLoadPanvideo(
      videoIndex: 0,
      direction: ScrollDirection.down,
      playAfterLoaded: false,
      volumne: 0, // mute origin vidoe voice, play panmusic instead
    ));
  }

  Future<void> _onInitPanMusic(PanMusicDto music) async {
    _panMusic = music;
    await _panMusicPlayer.setPanMusicSource(_panMusic!);
    await _panMusicPlayer.pause();
    await _panMusicPlayer.seekTo(Duration.zero);
  }

  Future<void> _onEidtPanVideo(OnEditPanvideo event, Emitter<BaseState> emit) async {
    File? musicFile;
    if (_panMusic != null) {
      musicFile = await handleUsecaseResult(
        usecaseResult: _downloadFile.call(_panMusic!.musicUrl),
        emit: emit.call,
      );

      if (musicFile == null) {
        return;
      }
    }

    await handleUsecaseResult(
      usecaseResult: _editPanvideo.call(
        EditPanvideoArgs(
          _panvideo,
          integratedMusic: musicFile,
        ),
      ),
      onSuccess: (File edited) {
        _editedVideos.add(edited);
        _setUpPlayingEditedVideo(edited);
        return EditPanvideoSuccess(edited);
      },
      emit: emit.call,
    );
  }

  Future<void> _setUpPlayingEditedVideo(File edited) async {
    _panMusic = null;
    add(OnSetPanvideoDatasources(
      datasources: [
        VideoDatasource(BetterPlayerDataSourceType.file, edited.path, thumbImageUrl: ''),
      ],
    ));
    add(OnLoadPanvideo(
      videoIndex: 0,
      direction: ScrollDirection.down,
      playAfterLoaded: false,
      volumne: Constants.defaultVolumne,
    ));
  }

  @override
  void onTransition(Transition<BaseEvent, BaseState> transition) {
    switch (transition.currentState) {
      case (InitVideoControllerSuccess state):
        state.controller.removeEventsListener(_panvideoEventListener);
        state.controller.addEventsListener(_panvideoEventListener);
      // if (_panMusic != null) {
      //   panvideoManager.setVolumne(0);
      // }
    }
    super.onTransition(transition);
  }

  Future<void> _panvideoEventListener(BetterPlayerEvent event) async {
    if (_panMusic == null) return;

    switch (event.betterPlayerEventType) {
      case BetterPlayerEventType.finished:
        await _panMusicPlayer.pause();
        await _panMusicPlayer.seekTo(Duration.zero);
        break;
      case BetterPlayerEventType.play:
        await _panMusicPlayer.play(_panMusic!);
        break;
      case BetterPlayerEventType.pause:
        await _panMusicPlayer.pause();
        break;
      case BetterPlayerEventType.seekTo:
        await _panMusicPlayer.seekTo(panvideoManager.videoPosition);
        break;
      default:
    }
  }

  @disposeMethod
  @override
  Future<void> close() async {
    super.close();
    disposeAllSubscriptions();
    _panMusicPlayer.dispose();
    // Remove edited video files
    for (File video in _editedVideos) {
      video.delete();
    }
    _editedVideos.clear();
  }
}
