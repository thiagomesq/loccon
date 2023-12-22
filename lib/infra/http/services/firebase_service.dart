import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dumpin/firebase_options.dart';

class FirebaseService {
  static Future<FirebaseService> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,
    );
    return FirebaseService();
  }
}
