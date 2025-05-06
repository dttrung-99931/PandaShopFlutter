import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:evievm_app/main_dev_home.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('screenshot', () {
    testWidgets('capture screenshot', (WidgetTester tester) async {
      app.main();

      // TRigger building frame, wait for first frame built complete
      // await tester.pump();
      // Wait for all frame building compelte like animation
      await tester.pumpAndSettle();

      await binding.takeScreenshot('home_screen');
    });
  });
}
