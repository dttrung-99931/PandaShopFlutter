import 'package:flutter/material.dart';
import 'package:golden_screenshot/golden_screenshot.dart';

/// A [MaterialApp] that produces golden images
/// with [device]'s resolution, pixel ratio, and frame.
class CustomScreenshotApp extends StatelessWidget {
  const CustomScreenshotApp({
    super.key,
    required this.device,
    this.frameColors,
    this.localizationsDelegates,
    this.supportedLocales,
    required this.child,
  });

  /// The device whose resolution and pixel ratio will be simulated,
  /// and whose frame will be drawn around the [child].
  final ScreenshotDevice device;

  /// The localization delegates that will be passed to [MaterialApp].
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// The supported locales that will be passed to [MaterialApp].
  final Iterable<Locale>? supportedLocales;

  /// The colors of the device frame.
  final ScreenshotFrameColors? frameColors;

  /// The page that will be rendered inside the device frame.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: RepaintBoundary(
        child: SizedBox(
          width: device.resolution.width,
          height: device.resolution.height,
          child: FittedBox(
            child: SizedBox(
              width: device.resolution.width / device.pixelRatio,
              height: device.resolution.height / device.pixelRatio,
              child: MediaQuery(
                data: MediaQueryData(
                  size: device.resolution / device.pixelRatio,
                  devicePixelRatio: device.pixelRatio,
                ),
                child: device.frameBuilder(
                  device: device,
                  frameColors: frameColors,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
