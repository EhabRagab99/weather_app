// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/provider/loading_provider.dart';
// import 'package:iem_app/widgets/buttons.dart';
// import 'package:iem_app/widgets/custom_fields_widget.dart';
//
// class PricePopUpWidget extends StatelessWidget {
//   final VoidCallback addOnTap;
//   final String title;
//   final String hintText;
//   final String buttonName;
//   final TextEditingController englishController;
//   final Function(String val) englishOnChanged;
//
//   const PricePopUpWidget({
//     Key? key,
//     required this.addOnTap,
//     required this.title,
//     required this.hintText,
//     required this.buttonName,
//     required this.englishController,
//     required this.englishOnChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final loadingProviderClass = Provider.of<LoadingProviderClass>(context,);
//
//     return Padding(
//       padding: EdgeInsets.only(top: SizeConfig.height * 0.1,bottom:SizeConfig.height * 0.15,),
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Material(
//           color: Colors.transparent,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 padding: EdgeInsets.all(SizeConfig.height * 0.02773),
//                 width:SizeConfig.height * 0.4,
//                 decoration: BoxDecoration(
//                   color: ColorConfig().appbarBackgroundColor(1),
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Column(
//                   children: [
//                     SizedBox(height:SizeConfig.height * 0.01 ,),
//
//                     /// title
//                     Text(
//                       AppLocalizations.of(context)!.translate(title).toString(),
//                       textAlign: TextAlign.center,
//                       style: Theme.of(context).textTheme.displaySmall!.copyWith(color:ColorConfig().fontBlackColor(1),fontWeight: FontWeight.w600),
//                     ),
//
//                     SizedBox(height:SizeConfig.height * 0.03 ,),
//
//
//                     // english
//                     CustomLoginTextField(
//                       controller: englishController,
//                       keyboardType:TextInputType.text ,
//                       textInputAction: TextInputAction.done,
//                       allowNumber: false,
//                       optional: false,
//                       allowPaste: true,
//                       isPassword: false,
//                       isBirthDate: false,
//                       obscureText: false,
//                       autofocus: true,
//                       enabled: !loadingProviderClass.showPageLoading,
//                       onlyNumber: false,
//                       allowEmoji: false,
//                       allowSpecial: false,
//                       allowArabic: true,
//                       withIcon: false,
//                       withButtonIcon: false,
//                       iconSize: SizeConfig.height*0.027,
//                       buttonIconSize: SizeConfig.height*0.027,
//                       buttonIconColor: ColorConfig().iconGrey2Color(0.6),
//                       buttonOnTap: (){},
//                       icon: "lastName",
//                       buttonIcon: "",
//                       hintText: hintText,
//                       onTap:()=>(){},
//                       onChanged: englishOnChanged,
//                       validator:(val)=>null,
//
//                     ),
//
//                     AnimatedOpacity(
//                       duration: const Duration(milliseconds: 300),
//                       opacity: loadingProviderClass.showAddOptionError?1:0,
//                       child:Visibility(
//                         visible: loadingProviderClass.showAddOptionError,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: SizeConfig.height * 0.005,right: SizeConfig.height * 0.005,top: SizeConfig.height * 0.005),
//                           child: Row(
//                             children: [
//                               Text(
//                                 AppLocalizations.of(context)!.translate("fieldRequired").toString(),
//                                 style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorConfig().fontRedColor(1),fontWeight: FontWeight.normal),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     SizedBox(height:SizeConfig.height * 0.03,),
//
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.03),
//                       child: CustomMainButton(
//                         onPress: addOnTap,
//                         buttonText:buttonName,
//                         elevation: 0,
//                         onPressColor: ColorConfig().cardBlackColor(0.5),
//                         enabled: true,
//                         backgroundColor: ColorConfig().buttonBlueColor(1),
//                         borderColor: ColorConfig().buttonBlueColor(1),
//                         borderWidth:0 ,
//                         shadowColor: ColorConfig().buttonBlueColor(1),
//                         style:Theme.of(context).textTheme.headlineMedium!.copyWith(
//                           color:ColorConfig().fontWhiteColor(1),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//
//
//                     SizedBox(height:SizeConfig.height * 0.01 ,),
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
