// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// class DropDownMenu extends StatelessWidget {
//   final bool isRequired;
//   final String ? dropDownHint;
//   final List<DropdownMenuItem<Object>>? dropdownItems;
//   final Object? value;
//   final Function(Object?) onChanged;
//   const DropDownMenu({Key? key,this.isRequired=true,this.dropDownHint,required this.dropdownItems,required this.onChanged,this.value}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//
//         Visibility(
//           visible: isRequired,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding:  EdgeInsets.only(right: SizeConfig.height*.01),
//                 child: Image(
//                   height: SizeConfig.height*.01,
//                   width: SizeConfig.height*.01,
//                   color: ColorConfig().iconRedColor(1),
//                   image: const AssetImage('assets/icons/astric.png'),
//                 ),
//               ),
//               SizedBox(height: SizeConfig.height*.0030,),
//             ],
//           ),
//         ),
//
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(SizeConfig.height*0.02),
//             border: Border.all(color:ColorConfig().iconLightBlueColor(0.5), width: 0.5,),),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.02,),
//             child: DropdownButton<Object>(
//               isExpanded: true,
//               hint:Text(
//                 AppLocalizations.of(context)!.translate(dropDownHint??'chooseValue').toString(),
//                 style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorConfig().fontBlueColor(1), fontWeight: FontWeight.w500,
//                 ),
//               ),
//               items:dropdownItems,
//               onChanged: onChanged,
//               value:value,
//               icon: SvgPicture.asset("assets/icons/arrow_bottom.svg",
//                 width: SizeConfig.height*0.008, height:SizeConfig.height*0.008,
//                 colorFilter: ColorFilter.mode(ColorConfig().iconLightBlueColor(0.7), BlendMode.srcIn),
//
//               ),
//               underline: const SizedBox.shrink(),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
