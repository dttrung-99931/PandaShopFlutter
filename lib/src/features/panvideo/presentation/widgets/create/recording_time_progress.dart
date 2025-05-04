// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/create_panvideo_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:flutter/material.dart';

class RecordingTimeProgress extends StatefulWidget {
  const RecordingTimeProgress({
    super.key,
    required this.durationInSecs,
    required this.onComplete,
  });
  final int durationInSecs;
  final VoidCallback onComplete;

  @override
  State<RecordingTimeProgress> createState() => _RecordingTimeProgressState();
}

class _RecordingTimeProgressState extends State<RecordingTimeProgress> {
  late final int _totalDurationInMilliseconds;
  late int _elapsedMilliseconds;
  late Timer _timer;
  static const updateDurationInMilis = 200;

  @override
  void initState() {
    super.initState();
    _totalDurationInMilliseconds = widget.durationInSecs * 1000;
    _elapsedMilliseconds = 0;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: updateDurationInMilis), (timer) {
      setState(() {
        _elapsedMilliseconds += updateDurationInMilis;
        if (_elapsedMilliseconds >= _totalDurationInMilliseconds) {
          _timer.cancel();
          widget.onComplete();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlocListener<CreatePanVideoBloc>(
      listenForStates: const [
        PanvideoRecordingPaused,
        PanvideoRecordingResumed,
      ],
      listener: (state) {
        switch (state) {
          case PanvideoRecordingPaused _:
            _timer.cancel();
          case PanvideoRecordingResumed _:
            _startTimer();
        }
      },
      child: LinearProgressIndicator(
        value: _elapsedMilliseconds / _totalDurationInMilliseconds,
        backgroundColor: Colors.black12,
        color: Colors.red,
      ),
    );
  }
}
