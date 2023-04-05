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
        return macos;
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
    apiKey: 'AIzaSyAjZnmCd0KCRTfPWBJDY-cR7YfFycG251Q',
    appId: '1:46521434016:web:016108f7eedeee82c4eec5',
    messagingSenderId: '46521434016',
    projectId: 'chatapp-5c171',
    authDomain: 'chatapp-5c171.firebaseapp.com',
    storageBucket: 'chatapp-5c171.appspot.com',
    measurementId: 'G-7ZF3D8W0JK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPgRczT8gWRSUdVrmoKEimgUgCXm6tF-Y',
    appId: '1:46521434016:android:46e3b7e9795a152ac4eec5',
    messagingSenderId: '46521434016',
    projectId: 'chatapp-5c171',
    storageBucket: 'chatapp-5c171.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-f4PqGURHcXEohjoxSiFF-Gl802A1tes',
    appId: '1:46521434016:ios:ea6f7e0f08c20ed5c4eec5',
    messagingSenderId: '46521434016',
    projectId: 'chatapp-5c171',
    storageBucket: 'chatapp-5c171.appspot.com',
    iosClientId: '46521434016-6cslj120u2v6gf0dv0h4osuap2td9pq6.apps.googleusercontent.com',
    iosBundleId: 'com.example.amazon',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-f4PqGURHcXEohjoxSiFF-Gl802A1tes',
    appId: '1:46521434016:ios:ea6f7e0f08c20ed5c4eec5',
    messagingSenderId: '46521434016',
    projectId: 'chatapp-5c171',
    storageBucket: 'chatapp-5c171.appspot.com',
    iosClientId: '46521434016-6cslj120u2v6gf0dv0h4osuap2td9pq6.apps.googleusercontent.com',
    iosBundleId: 'com.example.amazon',
  );
}