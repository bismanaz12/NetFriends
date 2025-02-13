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
    apiKey: 'AIzaSyD5zzgmRdooU5Doyk_ygdjVZqPxHjNgnRo',
    appId: '1:268507804862:web:3998017180599414021aef',
    messagingSenderId: '268507804862',
    projectId: 'social-app-66432',
    authDomain: 'social-app-66432.firebaseapp.com',
    storageBucket: 'social-app-66432.appspot.com',
    measurementId: 'G-XR5BN7ER77',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDE2CaHuaUOoKcYg6P1DVz2bo93lxHLP0s',
    appId: '1:268507804862:android:18800689ce523ad5021aef',
    messagingSenderId: '268507804862',
    projectId: 'social-app-66432',
    storageBucket: 'social-app-66432.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAB35-ZCg8XCHrZ4mvGZF8B5HlaqD9tGqE',
    appId: '1:268507804862:ios:46d06cca5d8e49ab021aef',
    messagingSenderId: '268507804862',
    projectId: 'social-app-66432',
    storageBucket: 'social-app-66432.appspot.com',
    iosBundleId: 'com.example.socialApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAB35-ZCg8XCHrZ4mvGZF8B5HlaqD9tGqE',
    appId: '1:268507804862:ios:33c0ce3a2550f087021aef',
    messagingSenderId: '268507804862',
    projectId: 'social-app-66432',
    storageBucket: 'social-app-66432.appspot.com',
    iosBundleId: 'com.example.socialApp.RunnerTests',
  );
}
