// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/decorations_config.dart';
//
// class ThankYouPopupWidget extends StatelessWidget {
//   final String titleText;
//   final String gif;
//   final void Function() onTap;
//
//
//   const ThankYouPopupWidget({
//     Key? key,
//     required this.titleText,
//     required this.gif,
//     required this.onTap,
//
//
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Padding(
//       padding: EdgeInsets.only(top: SizeConfig.height * 0.23),
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Material(
//           borderRadius: BorderRadius.circular(SizeConfig.height*0.04),
//           color: ColorConfig().cardWhiteColor(1),
//           child: Directionality(
//             textDirection: AppLocalizations.of(context)!.locale.languageCode=='ar'?TextDirection.rtl:TextDirection.ltr,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(SizeConfig.height * 0.02773),
//                   width:SizeConfig.height * 0.38,
//                   decoration: popUpDecoration,
//                   child: GestureDetector(
//                     onTap: onTap,
//                     child: Column(
//                       children: [
//
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             GestureDetector(
//                               onTap:onTap,
//                               child: Icon(
//                                 Icons.clear,
//                                 color: ColorConfig().iconNavyColor(1),
//                               ),
//                             ),
//                           ],
//                         ),
//
//                         SizedBox(height:SizeConfig.height * 0.0 ,),
//
//                         SizedBox(
//                           width: SizeConfig.height*0.18,
//                           height: SizeConfig.height*0.18,
//                           child: Opacity(
//                             opacity: 1,
//                             child: Lottie.asset(
//                               "assets/gif/$gif.json",
//                             ),
//                           ),
//                         ),
//
//                         SizedBox(height:SizeConfig.height * 0.02 ,),
//
//                         /// title
//                         Text(
//                           AppLocalizations.of(context)!.translate(titleText).toString(),
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context).textTheme.displaySmall!.copyWith(color:ColorConfig().fontLightBlueColor(1),fontWeight: FontWeight.w500),
//                         ),
//
//                         SizedBox(
//                           height:SizeConfig.height * 0.0 ,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
