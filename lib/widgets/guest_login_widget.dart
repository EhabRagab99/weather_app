// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/main.dart';
// import 'package:iem_app/widgets/buttons.dart';
//
// class GuestLoginWidget extends StatelessWidget {
//   final String title;
//   final String description;
//
//   const GuestLoginWidget ({Key? key,required this.title,required this.description,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // image
//
//         SizedBox(
//           width: SizeConfig.height*0.23,
//           height: SizeConfig.height*0.23,
//           child:Lottie.asset(
//             "assets/gif/guest_user.json",
//             fit: BoxFit.contain,
//           ),
//         ),
//
//         // title
//         Padding(
//           padding: EdgeInsets.only(top: SizeConfig.height*0.05,left: SizeConfig.height * 0.00463,right: SizeConfig.height * 0.00463),
//           child: Text(
//             AppLocalizations.of(context)!.translate(title).toString(),
//             style: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorConfig().fontGrey1Color(1),fontWeight: FontWeight.w800,),
//             textAlign: TextAlign.center,
//           ),
//         ),
//
//         // description
//         Padding(
//           padding: EdgeInsets.only(top: SizeConfig.height*0.02,left: SizeConfig.height * 0.04,right: SizeConfig.height * 0.04),
//           child: Text(
//             AppLocalizations.of(context)!.translate(description).toString(),
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorConfig().fontGrey2Color(1),fontWeight: FontWeight.normal,),
//           ),
//         ),
//
//         // sign in
//         Container(
//           width: SizeConfig.height * 0.314,
//           margin: EdgeInsets.only(top: SizeConfig.height*0.05,left:SizeConfig.height*0.04,right: SizeConfig.height*0.04 ),
//           child: CustomMainButton(
//             onPress: () async {
//               customPushNavigatorAndNotChangeContent(TaskApp.navigatorKey.currentState!.context, const SignInSeekerScreen(withBackButton: false,));
//             },
//             buttonText: "signIn",
//             elevation: 0,
//             onPressColor: ColorConfig().cardBlackColor(0.5),
//             enabled: true,
//             backgroundColor: ColorConfig().buttonBlueColor(1),
//             borderColor: ColorConfig().buttonBlueColor(1),
//             borderWidth:0 ,
//             shadowColor: ColorConfig().buttonBlueColor(1),
//             style:Theme.of(context).textTheme.headlineMedium!.copyWith(
//               color:ColorConfig().fontWhiteColor(1),
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//
//
//       ],
//     );
//   }
// }
