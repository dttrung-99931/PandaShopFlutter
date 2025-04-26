// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:flutter/material.dart';

class PanvideoControllerBuilder extends StatefulWidget {
  const PanvideoControllerBuilder({super.key, required this.builder, this.onInitilized});
  final Widget Function(BetterPlayerController controller) builder;
  final void Function(BetterPlayerController controller)? onInitilized;

  @override
  State<PanvideoControllerBuilder> createState() => _PanvideoControllerBuilderState();
}

class _PanvideoControllerBuilderState extends State<PanvideoControllerBuilder> {
  bool _init = false;

  @override
  void initState() {
    super.initState();
    doOnBuildUICompleted(() {
      // Check init only one time for ignore errors when hot-reloading
      if (!_init) {
        panvideoManagerBloc.add(OnInitVideoController(aspectRatio: MediaQuery.sizeOf(context).aspectRatio));
        _init = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      panvideoManagerBloc.add(OnInitVideoController(aspectRatio: constraints.maxWidth / constraints.maxHeight));
      return CustomBlocConsumer<PanvideoManagerBloc>(
        listener: (state) {
          if (state is InitVideoControllerSuccess) {
            widget.onInitilized?.call(state.controller);
          }
        },
        buildForStates: const [InitVideoControllerSuccess],
        handleLoading: false,
        builder: (state) {
          if (state is! InitVideoControllerSuccess) {
            return emptyWidget;
          }
          return widget.builder(state.controller);
        },
      );
    });
  }
}
