// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

part 'panmusic_player_event.dart';
part 'panmusic_player_state.dart';

PanMusicPlayerBloc get panMusicPlayerBloc => getIt<PanMusicPlayerBloc>();

@lazySingleton
class PanMusicPlayerBloc extends BaseBloc {
  PanMusicPlayerBloc() : super(InitialState()) {
    on<OnPlayPanMusic>(_onPlayPanMusic);
    on<OnPausePanMusic>(_onPausePanMusic);
  }

  PanMusicDto? _playingMusic;
  PanMusicDto? get playingMusic => _playingMusic;

  AudioPlayer? _player;

  Future<void> _onPausePanMusic(OnPausePanMusic event, Emitter<BaseState> emit) async {
    if (_playingMusic == event.music && _player?.playing != false) {
      await _player?.pause();
    }
    emit(PanMusicPaused(event.music));
  }

  void _initPlayer() {
    _player = AudioPlayer();
  }

  Future<void> _onPlayPanMusic(OnPlayPanMusic event, Emitter<BaseState> emit) async {
    if (_playingMusic == event.music && _player?.playing == true) {
      return;
    }

    emit(PanMusicLoading(event.music));

    if (_player == null) {
      _initPlayer();
    }

    if (_playingMusic != null) {
      await _onPausePanMusic(OnPausePanMusic(_playingMusic!), emit);
    }

    _playingMusic = event.music;
    try {
      await _player!.setAudioSource(
        AudioSource.uri(
          Uri.parse(event.music.musicUrl),
        ),
      );
      _player!.play();
      emit(PanMusicPlaying(event.music));
    } catch (e) {
      emit(
        PanMusicError(event.music, Failure(e.toString())),
      );
    }
  }

  @disposeMethod
  @override
  Future<void> close() {
    _player?.dispose();
    return super.close();
  }
}
