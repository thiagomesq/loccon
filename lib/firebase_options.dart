// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDFq9QDy87XR2zrU2hyJgiLt5etEXRON4Y',
    appId: '1:318126077828:web:41d62c8d5a6fe821abcfd1',
    messagingSenderId: '318126077828',
    projectId: 'dumpin-c2811',
    authDomain: 'dumpin-c2811.firebaseapp.com',
    storageBucket: 'dumpin-c2811.appspot.com',
    measurementId: 'G-3YSYKFSW9E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqOr6KrsX1zr60tddX3ppucuhQbZdNNvc',
    appId: '1:318126077828:android:82cb82767e38736eabcfd1',
    messagingSenderId: '318126077828',
    projectId: 'dumpin-c2811',
    storageBucket: 'dumpin-c2811.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoZdcVYNm-jlc66_E-dpb2pOKSMavnyJE',
    appId: '1:318126077828:ios:d97b453177ea3bc8abcfd1',
    messagingSenderId: '318126077828',
    projectId: 'dumpin-c2811',
    storageBucket: 'dumpin-c2811.appspot.com',
    androidClientId: '318126077828-bjuc2o8g1mgc6vncbajjd8gmtdr38dee.apps.googleusercontent.com',
    iosBundleId: 'com.example.loccon',
  );
}
