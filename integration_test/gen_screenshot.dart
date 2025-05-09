import 'package:evievm_app/app.dart';
import 'package:evievm_app/main_dev.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:integration_test/integration_test.dart';

import 'custom_screenshot_app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    await configDev();
    await setupApp();
  });

  group('screenshot', () {
    List<ScreenshotDevice> devices = [
      const ScreenshotDevice(
        platform: TargetPlatform.android,
        pixelRatio: 2.6,
        resolution: Size(1080, 2400),
        goldenSubFolder: 'android/',
        frameBuilder: ScreenshotFrame.android,
      ),
      const ScreenshotDevice(
        platform: TargetPlatform.android,
        pixelRatio: 3,
        resolution: Size(1170, 2532),
        goldenSubFolder: 'ios/',
        frameBuilder: ScreenshotFrame.newerIphone,
      ),
    ];

    _takeScreenshot(
      fileName: "Home",
      devices: devices,
      navigation: (WidgetTester tester) async {},
    );
  });
}

void _takeScreenshot({
  required String fileName,
  required Future<void> Function(WidgetTester tester) navigation,
  required List<ScreenshotDevice> devices,
}) {
  group(fileName, () {
    for (final device in devices) {
      testGoldens(fileName, (WidgetTester tester) async {
        final screenshotApp = CustomScreenshotApp(
          device: device,
          child: const PandaShopApp(),
        );
        await tester.pumpWidget(screenshotApp);
        await navigation(tester);
        await tester.pumpAndSettle();

        await tester.precacheImagesInWidgetTree(widgetType: CustomScreenshotApp);
        await tester.precacheTopbarImages(widgetType: CustomScreenshotApp);
        await tester.loadFonts();

        // Wait for UI rendering complete
        // await tester.pumpFrames(screenshotApp, const Duration(seconds: 1));
        await tester.pumpAndSettle();

        // await tester.pumpAndSettle();
        await tester.expectScreenshot(
          device,
          fileName,
        );
      });
    }
  });
}
