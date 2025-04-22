// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:flutter/material.dart';

/// Widget build on [controller] changed
class VideoPlayerWidgetBuilder<T> extends StatefulWidget {
  final BetterPlayerController controller;
  final Widget Function(BuildContext context, T value) builder;

  /// Get value to check whether should rebuild
  final T Function(BetterPlayerController controller) getValue;

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
  late T _value;

  @override
  void initState() {
    super.initState();
    _value = widget.getValue(widget.controller);
    widget.controller.addEventsListener(_listener);
  }

  @override
  void didUpdateWidget(covariant VideoPlayerWidgetBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeEventsListener(_listener);
      widget.controller.addEventsListener(_listener);
    }
  }

  void _listener(BetterPlayerEvent event) {
    T updatedValue = widget.getValue(widget.controller);
    if (updatedValue != _value && mounted) {
      _value = updatedValue;
      // Rebuild when tracking value from CameraController changed
      setState(() {});
    }
  }

  @override
  void dispose() {
    widget.controller.removeEventsListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _value);
  }
}
