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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAe23hvzKXxB5IFuFu8J2OAhcQH7IztswU',
    appId: '1:789567736:web:b81fa70072eb61bbf9030d',
    messagingSenderId: '789567736',
    projectId: 'biblioteca-virtual-689ea',
    authDomain: 'biblioteca-virtual-689ea.firebaseapp.com',
    storageBucket: 'biblioteca-virtual-689ea.appspot.com',
    measurementId: 'G-65GERF94V7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChZBhIUCXs5RngKrZaDnHVG9rqBIEH54M',
    appId: '1:789567736:android:b7830267ce3ec2f2f9030d',
    messagingSenderId: '789567736',
    projectId: 'biblioteca-virtual-689ea',
    storageBucket: 'biblioteca-virtual-689ea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA78chk_imyo0-B2oQokcA4RTANUXJS86o',
    appId: '1:789567736:ios:e0fbb88d97c82139f9030d',
    messagingSenderId: '789567736',
    projectId: 'biblioteca-virtual-689ea',
    storageBucket: 'biblioteca-virtual-689ea.appspot.com',
    iosBundleId: 'com.example.verygoodcore.bilioteca-virtual',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA78chk_imyo0-B2oQokcA4RTANUXJS86o',
    appId: '1:789567736:ios:8ca04aba47b343acf9030d',
    messagingSenderId: '789567736',
    projectId: 'biblioteca-virtual-689ea',
    storageBucket: 'biblioteca-virtual-689ea.appspot.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAe23hvzKXxB5IFuFu8J2OAhcQH7IztswU',
    appId: '1:789567736:web:b84bc6dfd6e4800cf9030d',
    messagingSenderId: '789567736',
    projectId: 'biblioteca-virtual-689ea',
    authDomain: 'biblioteca-virtual-689ea.firebaseapp.com',
    storageBucket: 'biblioteca-virtual-689ea.appspot.com',
    measurementId: 'G-CCN0W2KS1T',
  );
}
