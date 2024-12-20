// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/shared_preference.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
//
//
// class CustomHtmlWidget extends StatelessWidget {
//   final String date;
//   final double fontSize;
//   final int? maxLines;
//   final Color? fontColor;
//   final FontWeight? fontWeight;
//   final double? lineHeight;
//   const CustomHtmlWidget({Key? key,this.lineHeight,this.fontColor,this.fontWeight,this.maxLines,required this.date,required this.fontSize,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if(date.isNotEmpty){
//       return MediaQuery.removePadding(
//         context: context,
//         removeBottom: true,
//         removeTop: true,
//
//         child: Row(
//           children: [
//             Expanded(
//               child: Html(
//                 data: date,
//                 shrinkWrap: true,
//                 style: {
//                   "body": Style(
//                     maxLines: maxLines,
//                     fontSize: FontSize(fontSize),
//                     fontFamily:SharedPref.getCurrentLang() == "ar"? "Tajawal" : "Tajawal",
//                     lineHeight: LineHeight.number(lineHeight??SizeConfig.height*0.00160),
//                     padding: HtmlPaddings.zero,
//                     margin: Margins.zero,
//                     fontWeight: fontWeight??FontWeight.normal,
//                     textOverflow: TextOverflow.ellipsis,
//                     color: fontColor??ColorConfig().secondaryColor(1),
//                   ),
//                   "h5":Style(
//                     fontSize: FontSize(fontSize),
//                     maxLines: maxLines,
//                     margin:Margins.only(bottom: SizeConfig.height*0.01,top: SizeConfig.height*0.02,),
//                     fontWeight: fontWeight??FontWeight.normal,
//                     padding: HtmlPaddings.zero,
//                     textOverflow: TextOverflow.ellipsis,
//                     color: fontColor??ColorConfig().primaryColor(1),
//                     lineHeight: LineHeight.number(lineHeight??SizeConfig.height*0.00160),
//                     textDecoration: TextDecoration.none,
//                   ),
//                   "p": Style(
//                     maxLines: maxLines,
//                     fontSize: FontSize(fontSize),
//                     margin:Margins.only(bottom: SizeConfig.height*0.0,top: SizeConfig.height*0.0,),
//
//                     fontWeight: fontWeight??FontWeight.normal,
//                     textOverflow: TextOverflow.ellipsis,
//                     padding: HtmlPaddings.zero,
//                     color:fontColor?? ColorConfig().secondaryColor(1),
//                     lineHeight: LineHeight.number(lineHeight??SizeConfig.height*0.00160),
//                   ),
//                   "a":Style(
//                     maxLines: maxLines,
//                     fontSize: FontSize(fontSize),
//                     margin: Margins.zero,
//                     fontWeight: fontWeight??FontWeight.normal,
//                     padding: HtmlPaddings.zero,
//                     textOverflow: TextOverflow.ellipsis,
//                     color: fontColor??ColorConfig().primaryColor(1),
//                     lineHeight: LineHeight.number(lineHeight??SizeConfig.height*0.00160),
//                     textDecoration: TextDecoration.none,
//                   ),
//                   "strong":Style(
//                     maxLines: maxLines,
//                     fontSize: FontSize(fontSize),
//                     margin: Margins.zero,
//                     fontWeight: fontWeight??FontWeight.normal,
//                     padding: HtmlPaddings.zero,
//                     textOverflow: TextOverflow.ellipsis,
//                     color: fontColor??ColorConfig().secondaryColor(1),
//                     lineHeight: LineHeight.number(lineHeight??SizeConfig.height*0.00160),
//                     textDecoration: TextDecoration.none,
//                   ),
//                   "span":Style(
//                     maxLines: maxLines,
//                     fontSize: FontSize(fontSize),
//                     margin: Margins.zero,
//                     fontWeight: fontWeight??FontWeight.normal,
//                     padding: HtmlPaddings.zero,
//                     textOverflow: TextOverflow.ellipsis,
//                     color: fontColor??ColorConfig().secondaryColor(1),
//                     lineHeight: LineHeight.number(lineHeight??SizeConfig.height*0.00160),
//                   ),
//
//                   "div":Style(
//                     maxLines: maxLines,
//                     fontSize: FontSize(fontSize),
//                     fontWeight: fontWeight??FontWeight.normal,
//                     padding: HtmlPaddings.zero,
//                     margin: Margins.zero,
//                     textOverflow: TextOverflow.ellipsis,
//                     color: fontColor??ColorConfig().secondaryColor(1),
//                     lineHeight: LineHeight.number(lineHeight??SizeConfig.height*0.00160),
//                     // height: SizeConfig.height * 0.4,=,
//                   ),
//                   "li":Style(
//                     maxLines: maxLines,
//                     fontSize: FontSize(fontSize),
//                     margin: Margins.zero,
//                     fontWeight: fontWeight??FontWeight.normal,
//                     padding: HtmlPaddings.zero,
//                     textOverflow: TextOverflow.ellipsis,
//                     color: fontColor??ColorConfig().secondaryColor(1),
//                     lineHeight: LineHeight.number(lineHeight??SizeConfig.height*0.00160),
//                   ),
//                   "ol":Style(
//                     maxLines: maxLines,
//                     fontSize: FontSize(fontSize),
//                     fontWeight: fontWeight??FontWeight.normal,
//                     padding: HtmlPaddings.zero,
//                     margin: Margins.zero,
//                     textOverflow: TextOverflow.ellipsis,
//                     lineHeight: LineHeight.number(lineHeight??SizeConfig.height*0.00160),
//                     color: fontColor??ColorConfig().secondaryColor(1),
//
//                   ),
//                   "ul":Style(
//                     maxLines: maxLines,
//                     fontSize: FontSize(fontSize),
//                     fontWeight: fontWeight??FontWeight.normal,
//                     padding: HtmlPaddings.zero,
//                     margin: Margins.zero,
//                     textOverflow: TextOverflow.ellipsis,
//                     color: fontColor??ColorConfig().secondaryColor(1),
//                     lineHeight: LineHeight.number(lineHeight??SizeConfig.height*0.00160),
//                   ),
//                 },
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//     return const SizedBox.shrink();
//   }
// }
