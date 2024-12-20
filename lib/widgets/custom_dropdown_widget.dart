// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// class CustomDropDownWidget<T> extends StatelessWidget {
//   const CustomDropDownWidget({
//     super.key,
//     this.prefixIcon,
//     this.selectedValue,
//     required this.onChange,
//     this.validate,
//     required this.items,
//     this.borderColor,
//     this.width,
//     this.hint,
//      this.validationText,
//   });
//   final Widget? prefixIcon;
//   final Color? borderColor;
//   final List<DropdownMenuItem<T>> items;
//   final T? selectedValue;
//   final void Function(dynamic)? onChange;
//   final String? hint;
//   final String? Function(dynamic)? validate;
//   final double? width;
//   final String? validationText;
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField2(
//       scrollbarAlwaysShow: true,
//       // dropdownMaxHeight: 200.h,
//
//       value: selectedValue,
//       iconOnClick: const Icon(Icons.keyboard_arrow_up),
//       decoration:  InputDecoration(
//         isDense: true,
//         contentPadding: EdgeInsets.zero,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SizeConfig.height *0.01),
//           borderSide: BorderSide(
//             color: ColorConfig().greyBlackColor(1),
//           ),
//         ),
//         focusColor: ColorConfig().primaryColor(1),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SizeConfig.height *0.01),
//           borderSide: BorderSide(color: ColorConfig().primaryColor(1), width: 4),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SizeConfig.height *0.01),
//           borderSide: BorderSide(color: ColorConfig().redColor(1), width: 4),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SizeConfig.height *0.01),
//           borderSide: BorderSide(color: ColorConfig().redColor(1),),
//         ),
//       ),
//       hint: Text(
//         hint ?? '',
//         style: TextStyle(
//             fontSize: SizeConfig.height * 0.012,
//             color: const Color(0xFFA5A5A5),
//             fontWeight: FontWeight.w400),
//       ),
//       icon:  const Icon(Icons.keyboard_arrow_down),
//       // iconSize: 30,
//
//       buttonHeight: 50,
//       buttonPadding: EdgeInsetsDirectional.only(start: SizeConfig.height * 0.008, end: SizeConfig.height * 0.008),
//       dropdownDecoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: const Color(0xffEDEEF3),
//       ),
//       items: items,
//       validator: (value) {
//         if (value == null) {
//           return validationText;
//         }
//       },
//       onChanged: onChange,
//       onSaved: (value) {
//         // con.universityId = item.id;
//         print("selected universty onSaved $value");
//       },
//     );
//   }
// }
