// import 'package:iem_app/helpers/popup_helpers/show_popup_functions.dart';
// import 'package:iem_app/main.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class CameraPermissionHandel {
//   static Future askCameraPermission() async {
//     var status = await Permission.camera.status;
//     final permissionStatus = await Permission.camera.request();
//     if (status.isGranted) {
//       if (kDebugMode) {
//         print("-------permissionStatus.isGranted");
//       }
//     } else if (status.isPermanentlyDenied) {
//       if (kDebugMode) {
//         print("---is permissionStatus.isPermanentlyDenied");
//       } // maybe error at initial status
//       ShowPopUpFunctions.showDefaultAlert(
//         context: AlphaWeatherAPP.navigatorKey.currentState!.context,
//         hideWhenTap: true,
//         withTwoButton:false ,
//         twoOnTap:(){} ,
//         twoButtonName: '',
//         titleText: 'permissionPopUpTitle',
//         descriptionText: 'permissionCameraDesc',
//         oneButtonName: 'settings',
//         withCloseButton: true,
//         child: const SizedBox(),
//         oneOnTap: ()async{
//           Navigator.pop(AlphaWeatherAPP.navigatorKey.currentState!.context);
//           openAppSettings();
//         },
//       );
//     } else if (status.isDenied) {
//       if (kDebugMode) {
//         print("---permissionStatus.isDenied");
//       }
//     } else {
//       if (kDebugMode) {
//         print(permissionStatus.toString());
//       }
//     }
//   }
// }
