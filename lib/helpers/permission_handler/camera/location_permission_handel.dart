// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:geocoding/geocoding.dart' as goa;
// import 'package:location/location.dart';
//
// class LocationService {
//   late Location _location;
//   bool _serviceEnabled = false;
//   PermissionStatus? _grantedPermission;
//
//   LocationService() {
//     _location = Location();
//   }
//
//   Future<bool> _checkPermission() async {
//     try {
//       if (await _checkService()) {
//         _grantedPermission = await _location.hasPermission();
//         if (_grantedPermission == PermissionStatus.denied) {
//           _grantedPermission = await _location.requestPermission();
//         }
//       }
//     } catch (er) {
//       debugPrint(er.toString());
//     }
//
//     return _grantedPermission == PermissionStatus.granted;
//   }
//
//   Future<bool> _checkService() async {
//     try {
//       _serviceEnabled = await _location.serviceEnabled();
//       if (!_serviceEnabled) {
//         _serviceEnabled = await _location.requestService();
//       }
//     } on PlatformException catch (error) {
//       debugPrint('error code is ${error.code} and message = ${error.message}');
//       _serviceEnabled = false;
//       await _checkService();
//     }
//
//     return _serviceEnabled;
//   }
//
//   Future<LocationData?> getLocation() async {
//     if (await _checkPermission()) {
//       final locationData = _location.getLocation();
//       return locationData;
//     }
//
//     return null;
//   }
//
//   Future<goa.Placemark?> getPlaceMark(
//       {required LocationData locationData}) async {
//     final List<goa.Placemark> placeMarks = await goa.placemarkFromCoordinates(
//         locationData.latitude!, locationData.longitude!);
//     if (placeMarks.isNotEmpty) {
//       return placeMarks[0];
//     }
//
//     return null;
//   }
// }
// //
// // // import 'package:app_settings/app_settings.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:location/location.dart' as loc;
// //
// //
// // class LocationPermissionHandel {
// //
// //   static Future<bool> askLocationPermission() async{
// //     var status = await Permission.location.status;
// //     if(status.isGranted){
// //       debugPrint(status.name);
// //       return true;
// //     }
// //
// //     if(status.isPermanentlyDenied){
// //       debugPrint(status.name);
// //       // await AppSettings.openAppSettings();
// //       return false;
// //     }
// //     else {
// //       debugPrint(status.name);
// //       await Permission.location.request().then((value) {
// //         if(!status.isPermanentlyDenied){
// //           return true;
// //         }
// //         else{
// //           return false;
// //         }
// //       });
// //     }
// //     return false;
// //   }
// //
// //   Future<bool> checkGps() async {
// //     try{
// //       _serviceEnabled = await _location.serviceEnabled();
// //       if(!_serviceEnabled){
// //         _serviceEnabled = await _location.requestService();
// //       }
// //     } on PlatformException catch(error){
// //       print('error code is ${error.code} and message = ${error.message}');
// //       _serviceEnabled = false;
// //       await _checkService();
// //     }
// //
// //     return _serviceEnabled;
// //   }
// //
// //   static Future<bool> checkGps() async {
// //     loc.Location location = loc.Location();
// //     if (!await location.serviceEnabled()) {
// //       return await location.requestService();
// //     } else {
// //       return true;
// //     }
// //   }
// //
// // }
// //
// //
// //
// //
