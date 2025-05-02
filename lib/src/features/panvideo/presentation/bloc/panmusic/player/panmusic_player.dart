// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:panda_map/widgets/disposable_mixin.dart';

enum PanMusicPlayerState {
  initial,
  loading,
  playing,
  paused,
  error,
}

@lazySingleton
class PanMusicPlayer with DisposableMixin {
  PanMusicDto? _playingMusic;
  PanMusicDto? get playingMusic => _playingMusic;

  AudioPlayer? _player;

  final _playerStateStream = StreamController<PanMusicPlayerState>.broadcast();
  Stream<PanMusicPlayerState> get playerStateStream => _playerStateStream.stream;

  void _initPlayer() {
    _player = AudioPlayer();
    addSubscription(
      _player!.playerStateStream.listen((PlayerState state) {
        switch (state.processingState) {
          case ProcessingState.completed:
            _playingMusic = null;
            _playerStateStream.add(PanMusicPlayerState.initial);
            break;
          case ProcessingState.idle:
          case ProcessingState.buffering:
            _playerStateStream.add(PanMusicPlayerState.loading);
            break;
          case ProcessingState.ready:
            if (state.playing) {
              _playerStateStream.add(PanMusicPlayerState.playing);
            } else {
              _playerStateStream.add(PanMusicPlayerState.paused);
            }
            break;
          default:
            _playerStateStream.add(PanMusicPlayerState.error);
            break;
        }
      }),
    );
  }

  Future<void> play(PanMusicDto music, {bool resetPlayingMusic = false}) async {
    if (_playingMusic == music && _player?.playing == true) {
      return;
    }

    if (_playingMusic != null) {
      await pause();
    }

    _playingMusic = music;

    await setPanMusicSource(music);

    if (resetPlayingMusic || _player?.position == _player?.duration) {
      await _player?.seek(Duration.zero);
    }

    await _player?.play();
  }

  Future<void> setPanMusicSource(PanMusicDto music) async {
    if (_player == null) {
      _initPlayer();
    }

    await _player?.setAudioSource(
      AudioSource.uri(
        Uri.parse(music.musicUrl),
      ),
    );
  }

  Future<void> pause() async {
    if (_player?.playing == true) {
      await _player?.pause();
    }
  }

  Future<void> seekTo(Duration position) async {
    await _player?.seek(position);
  }

  void dispose() {
    _player?.dispose();
    _player = null;
  }
}
