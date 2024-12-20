// // ignore_for_file: deprecated_member_use
//
// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class LauncherHelperProvider {
//   Future shareFunc({required String textToShare}) async {
//     if (kDebugMode) {
//       print(textToShare);
//     }
//     await Share.share(
//       textToShare.toString(),
//       subject: textToShare,
//     );
//   }
//
//   /// open url on browser
//   openUrlOnBrowser({required String url}) async {
//     try {
//       await launch(url, forceSafariVC: false);
//       if (kDebugMode) {
//         print("Launched browser $url");
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print("Inside catch");
//       }
//     }
//   }
//
//   /// call phone
//   makeCallFunc({
//     required String phoneNumber,
//   }) async {
//     if (kDebugMode) {
//       print(phoneNumber);
//     }
//     launch("tel://${phoneNumber.toString()}");
//   }
//
//
//   /// whatsapp OLD
//   //  sendWhatsappFunc({required String phoneNumber,required String msgWillSend,}) async {
//   //   var url = 'https://api.whatsapp.com/send?phone=+201113662310&text=$msgWillSend';
//   //   if(await canLaunch(url)){
//   //     launch(url);
//   //   }
//   //   else{
//   //     if (kDebugMode) {
//   //       print("open whatsapp app link or do a sandbar with notification that there is no whatsapp installed");
//   //     }
//   //   }
//   // }
//
//   /// email
//   sendEmailFunc({
//     required String email,
//   }) async {
//     if (kDebugMode) {
//       print(email);
//     }
//     String finalUrl = '';
//
//     if (Platform.isAndroid) {
//       finalUrl = "mailto:$email?subject= &body= ";
//     } else if (Platform.isIOS) {
//       finalUrl = "mailto:$email";
//     } else {
//       finalUrl = "mailto:$email";
//     }
//
//     try {
//       await launch(finalUrl);
//       if (kDebugMode) {
//         print("Launched ");
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print("Inside catch");
//       }
//     }
//   }
//
//   /// facebook
//   launchFacebookPage({
//     required String forMobileAppUrl,
//     required String fbWebUrl,
//   }) async {
//     String finalUrl = "";
//
//     if (Platform.isAndroid) {
//       finalUrl = "fb://facewebmodal/f?href=$fbWebUrl"; //for android
//     } else if (Platform.isIOS) {
//       finalUrl = "fb://profile/$forMobileAppUrl";
//     } else {
//       finalUrl = "fb://facewebmodal/f?href=$forMobileAppUrl"; //for android
//     }
//
//     try {
//       bool launched = await launch(finalUrl, forceSafariVC: false);
//       if (kDebugMode) {
//         print("Launched Native app $launched");
//       }
//       if (!launched) {
//         await launch(fbWebUrl, forceSafariVC: false);
//         if (kDebugMode) {
//           print("Launched browser $launched");
//         }
//       }
//     } catch (e) {
//       await launch(fbWebUrl, forceSafariVC: false);
//       if (kDebugMode) {
//         print("Inside catch");
//       }
//     }
//   }
//
//   /// instagram
//   launchInstagram({
//     required String profileUrl,
//   }) async {
//     var url = 'https://www.instagram.com/$profileUrl';
//
//     try {
//       bool launched = await launch(url, forceSafariVC: false);
//       if (kDebugMode) {
//         print("Launched Native app $launched");
//       }
//       if (!launched) {
//         await launch(url, forceSafariVC: false);
//         if (kDebugMode) {
//           print("Launched browser $launched");
//         }
//       }
//     } catch (e) {
//       await launch(url, forceSafariVC: false);
//       if (kDebugMode) {
//         print("Inside catch");
//       }
//     }
//   }
//
//   /// Twitter
//   launchTwitter({
//     required String profileUrl,
//   }) async {
//     var url = 'https://twitter.com/$profileUrl';
//     try {
//       bool launched = await launch(url, forceSafariVC: false);
//       if (kDebugMode) {
//         print("Launched Native app $launched");
//       }
//       if (!launched) {
//         await launch(url, forceSafariVC: false);
//         if (kDebugMode) {
//           print("Launched browser $launched");
//         }
//       }
//     } catch (e) {
//       await launch(url, forceSafariVC: false);
//       if (kDebugMode) {
//         print("Inside catch");
//       }
//     }
//   }
//
//   /// snapchat
//   launchSnapChat({
//     required String forMobileAppUrl,
//     required String snWebUrl,
//   }) async {
//     String finalUrl = "";
//
//     if (Platform.isAndroid) {
//       finalUrl = "https://www.snapchat.com/$snWebUrl"; //for android
//     } else if (Platform.isIOS) {
//       finalUrl = "https://www.snapchat.com/$forMobileAppUrl";
//     } else {
//       finalUrl = "https://www.snapchat.com/$forMobileAppUrl"; //for android
//     }
//
//     try {
//       bool launched = await launch(finalUrl, forceSafariVC: false);
//       if (kDebugMode) {
//         print("Launched Native app $launched");
//       }
//       if (!launched) {
//         await launch(snWebUrl, forceSafariVC: false);
//         if (kDebugMode) {
//           print("Launched browser $launched");
//         }
//       }
//     } catch (e) {
//       await launch(snWebUrl, forceSafariVC: false);
//       if (kDebugMode) {
//         print("Inside catch");
//       }
//     }
//   }
//
//   directionToMap({required double latitude, required double longitude}) async {
//     String googleUrl =
//         'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
//     if (await canLaunch(googleUrl)) {
//       await launch(googleUrl, forceSafariVC: false);
//     } else {
//       throw 'Could not open the map.';
//     }
//   }
// }
