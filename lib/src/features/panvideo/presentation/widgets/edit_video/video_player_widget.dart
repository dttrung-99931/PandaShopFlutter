// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Widget build on [controller] changed
class VideoPlayerWidgetBuilder<T> extends StatefulWidget {
  final VideoPlayerController controller;
  final Function(BuildContext context, T value) builder;

  /// Get value to check whether should rebuild
  final T Function(VideoPlayerController controller) getValue;

  const VideoPlayerWidgetBuilder({
    super.key,
    required this.controller,
    required this.builder,
    required this.getValue,
  });

  @override
  State<VideoPlayerWidgetBuilder> createState() => _VideoPlayerWidgetBuilderState<T>();
}

class _VideoPlayerWidgetBuilderState<T> extends State<VideoPlayerWidgetBuilder<T>> {
  dynamic _value;

  @override
  void initState() {
    super.initState();
    widget.getValue(widget.controller);
    widget.controller.addListener(_listener);
  }

  void _listener() {
    T updatedValue = widget.getValue(widget.controller);
    if (updatedValue != _value && mounted) {
      // Rebuild when tracking value from CameraController changed
      setState(() {});
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.getValue(widget.controller));
  }
}
