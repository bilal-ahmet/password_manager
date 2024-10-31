// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyA1i6ddPLUhX7sVRVJJsmrWUruVVrmGuyE',
    appId: '1:924023449759:web:b8453dc8220ff226f19aaa',
    messagingSenderId: '924023449759',
    projectId: 'password-manager-2270c',
    authDomain: 'password-manager-2270c.firebaseapp.com',
    storageBucket: 'password-manager-2270c.firebasestorage.app',
    measurementId: 'G-6PD3LBYZLH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuqeJhf3R89r8dwkZdTlXXOsetlSi09nM',
    appId: '1:924023449759:android:a56dad775e745d62f19aaa',
    messagingSenderId: '924023449759',
    projectId: 'password-manager-2270c',
    storageBucket: 'password-manager-2270c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcwreOzXtSYMZdIkYPT7NMR3Z7cTil_Sg',
    appId: '1:924023449759:ios:adc8c3aa03c5a682f19aaa',
    messagingSenderId: '924023449759',
    projectId: 'password-manager-2270c',
    storageBucket: 'password-manager-2270c.firebasestorage.app',
    iosBundleId: 'com.example.passwordManager',
  );
}
