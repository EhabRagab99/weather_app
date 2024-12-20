// import 'dart:io';
//
// import 'package:iem_app/pages/auth_sign_up/provider/helper/register_provider.dart';
// import 'package:flutter/foundation.dart';
//
// String getPlatform({required bool enumIsMobileOnly}){
//   if(enumIsMobileOnly){
//     return PlatformsType.mobile.index.toString();
//   }
//   else{
//     if (kIsWeb) {
//       return PlatformsType.mobile.index.toString();
//     }
//     else{
//       if(Platform.isAndroid){
//         return PlatformsType.android.index.toString();
//       }
//       else if(Platform.isIOS){
//         return PlatformsType.ios.index.toString();
//       }
//       return PlatformsType.mobile.index.toString();
//     }
//   }
// }