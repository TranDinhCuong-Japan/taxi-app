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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDY3HOCV8HO7UF1OqiZPqPxAeEblrQINZE',
    appId: '1:579836620362:web:ab1154002b4f828e3c00b3',
    messagingSenderId: '579836620362',
    projectId: 'taxi-app-9ef2a',
    authDomain: 'taxi-app-9ef2a.firebaseapp.com',
    databaseURL: 'https://taxi-app-9ef2a-default-rtdb.firebaseio.com',
    storageBucket: 'taxi-app-9ef2a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiCP4PdXSzDYirrGc39tHJquj4hNzdW14',
    appId: '1:579836620362:android:e84bea241ac0af0e3c00b3',
    messagingSenderId: '579836620362',
    projectId: 'taxi-app-9ef2a',
    databaseURL: 'https://taxi-app-9ef2a-default-rtdb.firebaseio.com',
    storageBucket: 'taxi-app-9ef2a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAawMVVTUNEzVd7PAiFfdM5tyzzoEFrdi0',
    appId: '1:579836620362:ios:15144818499e068b3c00b3',
    messagingSenderId: '579836620362',
    projectId: 'taxi-app-9ef2a',
    databaseURL: 'https://taxi-app-9ef2a-default-rtdb.firebaseio.com',
    storageBucket: 'taxi-app-9ef2a.appspot.com',
    iosClientId: '579836620362-ni1agu1c58hbcppfp61ta7bdl61vt30u.apps.googleusercontent.com',
    iosBundleId: 'com.example.taxiApp',
  );
}
