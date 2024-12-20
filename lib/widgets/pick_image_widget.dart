// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class PickImageWidget extends StatelessWidget {
//   final String iconPath, title;
//   final Function() onUploadFileOrImage;
//   final bool? noTitle;
//   final Color? iconColor;
//   const PickImageWidget({super.key,  required this.onUploadFileOrImage,  this.noTitle=false, required this.iconPath, required this.title, this.iconColor});
//   @override
//   Widget build(BuildContext context) {
//       return InkWell(
//         onTap: onUploadFileOrImage,
//         child: SizedBox(
//           height: 50,
//           child: DottedBorder(
//             color: ColorConfig().primaryColor(1),
//             padding: EdgeInsets.zero,
//             borderType: BorderType.RRect,
//             radius: Radius.circular(10),
//             strokeWidth: 1,
//             dashPattern:const [5,2],
//             child: Container(
//               height: 50,
//               width: noTitle ==true ? 50 : double.infinity ,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: ColorConfig().primaryColor(1).withOpacity(0.1)
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   CircleAvatar(
//                     radius: 16,
//                       backgroundColor: ColorConfig().primaryColor(1),
//                       child: SvgPicture.asset(iconPath, colorFilter: ColorFilter.mode( iconColor ?? ColorConfig().primaryColor(1), BlendMode.srcIn),)),
//                if(noTitle == false)   SizedBox(width: 10),
//                   Text(
//                     title,
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: ColorConfig().primaryColor(1),
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//   }
// }
// class TextWidget extends StatelessWidget {
//   final String? title;
//
//   const TextWidget({super.key, this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(alignment: AlignmentDirectional.centerStart,
//       child: Text(
//         title ?? '',
//         style: TextStyle(
//           fontWeight: FontWeight.w400,
//           color: ColorConfig().primaryColor(1),
//           fontSize: 12,
//         ),
//       ),
//     );
//   }
// }
