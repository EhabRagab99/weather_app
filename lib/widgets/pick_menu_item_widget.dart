// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
//
// class PickMenuItemWidget extends StatelessWidget {
//   final void Function() onTap;
//   final String name;
//   final IconData icon;
//   final BorderRadiusGeometry borderRadius;
//   const PickMenuItemWidget({Key? key,required this.onTap,required this.name,required this.icon,required this.borderRadius, }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onTap,
//       style: ElevatedButton.styleFrom(
//         padding: const EdgeInsets.all(0),
//         elevation: 0.1,
//         shadowColor: Colors.transparent,
//         backgroundColor: ColorConfig().cardLightBlueColor(0.05),
//         foregroundColor: ColorConfig().cardBlackColor(1),
//         shape: RoundedRectangleBorder(
//           borderRadius: borderRadius,
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.02,vertical:SizeConfig.height*0.0 ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Expanded(
//               child: Text(
//                 AppLocalizations.of(context)!.translate(name).toString(),
//                 style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorConfig().fontWhiteColor(1),fontWeight: FontWeight.w400),
//               ),
//             ),
//             SizedBox(
//               width: SizeConfig.height * 0.00925,
//             ),
//             Icon(
//               icon,
//               size: SizeConfig.height * 0.02311,
//               color: ColorConfig().iconWhiteColor(1),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
