// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
//
// class SoundHelper with ChangeNotifier {
//   static final SoundHelper _instance = SoundHelper._internal();
//
//   factory SoundHelper() {
//     return _instance;
//   }
//
//   SoundHelper._internal();
//
//
//   String? addedToCartPath, likesPath;
//
//   Future<void> loadAddedToCartSound() async {
//     const soundPath = 'assets/sounds/added_to_cart.wav';
//     final bytes = await rootBundle.load(soundPath);
//     final tempDir = await getTemporaryDirectory();
//     final file = File('${tempDir.path}/added_to_cart.wav');
//     await file.writeAsBytes(bytes.buffer.asUint8List());
//     addedToCartPath = file.path;
//   }
//   Future<void> loadAddedLikeSound() async {
//     const soundPath = 'assets/sounds/like.wav';
//     final bytes = await rootBundle.load(soundPath);
//     final tempDir = await getTemporaryDirectory();
//     final file = File('${tempDir.path}/like.wav');
//     await file.writeAsBytes(bytes.buffer.asUint8List());
//     likesPath = file.path;
//   }
//
//   Future<void> playSound({required bool likesSound}) async {
//     // audioPlayer.play(likesSound==true ? likesPath ??'' : addedToCartPath??'',isLocal: true);
//   }
// }