// import 'package:iem_app/pages/auth_log_in/view/log_in_screen.dart';
// import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
// import 'package:flutter/material.dart';
// import 'package:iconly/iconly.dart';
//
// bool isEmailValid(String email) {
//   final emailRegex = RegExp(r'^[\w-]+(.[\w-]+)*@([\w-]+.)+[a-zA-Z]{2,7}$');
//   return emailRegex.hasMatch(email);
// }
//
// AppBar detailspageappbar(
//     BuildContext context, Widget widget, bool ceneredtitle, bool leading) {
//   return AppBar(
//     centerTitle: ceneredtitle,
//     backgroundColor: Colors.white,
//     elevation: 0,
//     title: widget,
//     leading: leading
//         ? IconButton(
//             onPressed: () {
//               SharedPref.logOut();
//               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> const LoginScreen()), (route) => false);
//             },
//             icon: const Icon(IconlyLight.logout))
//         : null,
//   );
// }
