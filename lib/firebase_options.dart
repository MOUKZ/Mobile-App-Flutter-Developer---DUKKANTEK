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
    apiKey: 'AIzaSyC_wWKdeVZdMQ8x0O0ds4c4ju4IddHxe1Q',
    appId: '1:711537676407:web:b67915e0765945f10e7672',
    messagingSenderId: '711537676407',
    projectId: 'login-70ca0',
    authDomain: 'login-70ca0.firebaseapp.com',
    storageBucket: 'login-70ca0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBO3DT6ZUK_b2MGUlPx7yXEHhCg7SGltro',
    appId: '1:711537676407:android:5e564d6264635ed50e7672',
    messagingSenderId: '711537676407',
    projectId: 'login-70ca0',
    storageBucket: 'login-70ca0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSfWKKXveK4_SmzfrnggqC0UHuxFBHMGg',
    appId: '1:711537676407:ios:4a54810b97424aef0e7672',
    messagingSenderId: '711537676407',
    projectId: 'login-70ca0',
    storageBucket: 'login-70ca0.appspot.com',
    androidClientId: '711537676407-8ckddo7a7ttb6rfer7aii9q4qqkh3tmj.apps.googleusercontent.com',
    iosClientId: '711537676407-8ja2pursb9sano2ci1tssp8o8ukmpjld.apps.googleusercontent.com',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSfWKKXveK4_SmzfrnggqC0UHuxFBHMGg',
    appId: '1:711537676407:ios:4a54810b97424aef0e7672',
    messagingSenderId: '711537676407',
    projectId: 'login-70ca0',
    storageBucket: 'login-70ca0.appspot.com',
    androidClientId: '711537676407-8ckddo7a7ttb6rfer7aii9q4qqkh3tmj.apps.googleusercontent.com',
    iosClientId: '711537676407-8ja2pursb9sano2ci1tssp8o8ukmpjld.apps.googleusercontent.com',
    iosBundleId: 'com.example.login',
  );
}
