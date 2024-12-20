// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/helpers/validations/validatetors.dart';
// import 'package:iem_app/widgets/custom_image_network.dart';
//
// class TeamMemberAvatar extends StatelessWidget {
//   final VoidCallback onTap;
//   final String name;
//   final String avatarImg;
//   final bool isSubsidiary;
//
//   const TeamMemberAvatar({Key? key, this.isSubsidiary=false,required this.onTap,required this.name,required this.avatarImg,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(SizeConfig.height*0.5),
//           color: ColorConfig().cardNavyColor(0.5),
//         ),
//         padding: EdgeInsets.all(SizeConfig.height*0.002),
//         child: Visibility(
//           visible: avatarImg.isNotEmpty&&avatarImg.length>43,
//           replacement: Center(
//             child: Text(
//               avatarFirstLastName(value:name).toUpperCase(),
//               style:isSubsidiary?Theme.of(context).textTheme.displaySmall!.copyWith(
//                 color: ColorConfig().fontWhiteColor(1),
//                 fontWeight:FontWeight.w600,
//               ): Theme.of(context).textTheme.headlineSmall!.copyWith(
//                 color: ColorConfig().fontWhiteColor(1),
//                 fontWeight:FontWeight.w600,
//               ),
//             ),
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(SizeConfig.height*0.5),
//             child: CustomImageNetwork(
//               image:avatarImg.toString(),
//               fit: BoxFit.fill,
//               loadingColor: ColorConfig().loadingGrey3Color(1),
//               errorBackground: ColorConfig().cardGrey2Color(0.1),
//               errorImage: 'image_null.png',
//               errorFit: BoxFit.contain,
//               errorImageSize: SizeConfig.height*0.02,
//               errorPadding: EdgeInsets.only(bottom: SizeConfig.height*0.00),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
