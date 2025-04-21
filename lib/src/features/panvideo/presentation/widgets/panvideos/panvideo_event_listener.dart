// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:flutter/material.dart';

class PanvideoEventListener extends StatefulWidget {
  const PanvideoEventListener({
    super.key,
    required this.controller,
    required this.child,
    required this.eventListener,
  });
  final BetterPlayerController controller;
  final Widget child;
  final dynamic Function(BetterPlayerEvent) eventListener;

  @override
  State<PanvideoEventListener> createState() => _PanvideoEventListenerState();
}

class _PanvideoEventListenerState extends State<PanvideoEventListener> {
  @override
  void initState() {
    widget.controller.addEventsListener(widget.eventListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeEventsListener(widget.eventListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
