// // import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';
//
// const _kShouldTestAsyncErrorOnInit = false;
//
// // Toggle this for testing Crashlytics in your app locally.
// const _kTestingCrashlytics = true;
//
// class FirebaseCrashlyticsConfig {
//   static FirebaseCrashlytics firebaseCrashlytics = FirebaseCrashlytics.instance;
//
//   static Future<void> initializeFlutterFireFuture = initializeFlutterFire();
//
//   static firebaseCrashlyticsInit() async {
//     // FlutterError.onError = (errorDetails) {
//     //   // If you wish to record a "non-fatal" exception, please use `FirebaseCrashlytics.instance.recordFlutterError` instead
//     //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
//     // };
//     // PlatformDispatcher.instance.onError = (error, stack) {
//     //   // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter
//     //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//     //   return true;
//     // };
//   }
//
//   static Future<void> testAsyncErrorOnInit() async {
//     Future<void>.delayed(const Duration(seconds: 2), () {
//       final List<int> list = <int>[];
//       if (kDebugMode) {
//         print(list[100]);
//       }
//     });
//   }
//
//   // Define an async function to initialize FlutterFire
//   static Future<void> initializeFlutterFire() async {
//     if (_kTestingCrashlytics) {
//       // Force enable crashlytics collection enabled if we're testing it.
//       await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
//     } else {
//       // Else only enable it in non-debug builds.
//       // You could additionally extend this to allow users to opt-in.
//       await FirebaseCrashlytics.instance
//           .setCrashlyticsCollectionEnabled(!kDebugMode);
//     }
//
//     if (_kShouldTestAsyncErrorOnInit) {
//       await testAsyncErrorOnInit();
//     }
//   }
//
//   static fireCrash() async {
//     if (kDebugMode) {
//       // Force disable Crashlytics collection while doing every day development.
//       // Temporarily toggle this to true if you want to test crash reporting in your app.
//       await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
//     } else {
//       await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
//
//       // Handle Crashlytics enabled status when not in Debug,
//       // e.g. allow your users to opt-in to crash reporting.
//     }
//   }
// }
