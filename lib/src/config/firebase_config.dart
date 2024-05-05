import 'package:evievm_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static Future<void> config() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
