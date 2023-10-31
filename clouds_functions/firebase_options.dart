// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart

 // ...
//   await Firebase.initializeApp(
//    options: DefaultFirebaseOptions.currentPlatform,
//  );
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
    apiKey: 'AIzaSyBbAvcC2jLQvAgd2OQBTvAJmwodbqIpBog',
    appId: '1:526397080002:web:589f49f0d7e746ca33165b',
    messagingSenderId: '526397080002',
    projectId: 'fun-fund-7b641',
    authDomain: 'fun-fund-7b641.firebaseapp.com',
    databaseURL: 'https://fun-fund-7b641-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fun-fund-7b641.appspot.com',
    measurementId: 'G-7YDMHCEBF7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5ntqVfzEkD1bjkjGuVfq5bwLfFMaYz9c',
    appId: '1:526397080002:android:bd02a948d67e334433165b',
    messagingSenderId: '526397080002',
    projectId: 'fun-fund-7b641',
    databaseURL: 'https://fun-fund-7b641-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fun-fund-7b641.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwky-2fsdjPQBM8jqxixFZOFr0jfhR0Sk',
    appId: '1:526397080002:ios:52cc92840456d84b33165b',
    messagingSenderId: '526397080002',
    projectId: 'fun-fund-7b641',
    databaseURL: 'https://fun-fund-7b641-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fun-fund-7b641.appspot.com',
    iosBundleId: 'com.example.krowdInvesmentFooter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwky-2fsdjPQBM8jqxixFZOFr0jfhR0Sk',
    appId: '1:526397080002:ios:06c6593bb78d5d2033165b',
    messagingSenderId: '526397080002',
    projectId: 'fun-fund-7b641',
    databaseURL: 'https://fun-fund-7b641-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fun-fund-7b641.appspot.com',
    iosBundleId: 'com.example.krowdInvesmentFooter.RunnerTests',
  );
}
