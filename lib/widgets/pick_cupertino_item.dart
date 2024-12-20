// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
//
// class PickCupertinoItemWidget extends StatelessWidget {
//   final VoidCallback onTap;
//   final String name;
//   final bool isDestructiveAction;
//   const PickCupertinoItemWidget({Key? key,required this.onTap,required this.name,required this.isDestructiveAction, }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoActionSheetAction(
//       isDefaultAction: !isDestructiveAction,
//       isDestructiveAction:isDestructiveAction ,
//       onPressed: onTap,
//       child: Text(
//         AppLocalizations.of(context)!.translate(name).toString(),
//         style:Theme.of(context).textTheme.displaySmall!.copyWith(
//           color:isDestructiveAction?ColorConfig().buttonRedColor(1):ColorConfig().buttonBlueColor(1),
//           fontWeight: FontWeight.w500,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }
