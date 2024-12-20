// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
//
// class ListEmptyWidget extends StatelessWidget {
//   final String title;
//   const ListEmptyWidget ({Key? key,required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Center(
//           child: Lottie.asset(
//             'assets/gif/empty_list.json',
//             height:SizeConfig.height*0.28,
//             width:SizeConfig.height*0.28,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(top: SizeConfig.height*0.0,left: SizeConfig.height * 0.00463,right: SizeConfig.height * 0.00463),
//           child: Text(
//             AppLocalizations.of(context)!.translate(title).toString(),
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorConfig().fontBlackColor(1),),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
