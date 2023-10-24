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
    apiKey: 'AIzaSyBiEFO6GeDimHILYJkP34AgstD7gn5fBtA',
    appId: '1:793037185207:web:e8575c31a6c690d1232d32',
    messagingSenderId: '793037185207',
    projectId: 'event-e3a4d',
    authDomain: 'event-e3a4d.firebaseapp.com',
    storageBucket: 'event-e3a4d.appspot.com',
    measurementId: 'G-KCVY6BLK45',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8WJbotOfX71i38-QxyB1iae7qMGVFbuc',
    appId: '1:793037185207:android:9040bb5b5911d5f3232d32',
    messagingSenderId: '793037185207',
    projectId: 'event-e3a4d',
    storageBucket: 'event-e3a4d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAP-PaBp0lBA9Kfsm1Q0DNIuMjKgzjFcjc',
    appId: '1:793037185207:ios:e177d397cdf4aef9232d32',
    messagingSenderId: '793037185207',
    projectId: 'event-e3a4d',
    storageBucket: 'event-e3a4d.appspot.com',
    androidClientId: '793037185207-dpsg32kt7t1ssuv0q2usok7kriki38c0.apps.googleusercontent.com',
    iosClientId: '793037185207-q1p7c190vm0c9bjafkj8rllqp1if0kbq.apps.googleusercontent.com',
    iosBundleId: 'com.example.eventapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAP-PaBp0lBA9Kfsm1Q0DNIuMjKgzjFcjc',
    appId: '1:793037185207:ios:e0fc2d99274a12e1232d32',
    messagingSenderId: '793037185207',
    projectId: 'event-e3a4d',
    storageBucket: 'event-e3a4d.appspot.com',
    androidClientId: '793037185207-dpsg32kt7t1ssuv0q2usok7kriki38c0.apps.googleusercontent.com',
    iosClientId: '793037185207-qg4l59g14p7379fnadhg9mtj2h3fad61.apps.googleusercontent.com',
    iosBundleId: 'com.example.eventapp.RunnerTests',
  );
}