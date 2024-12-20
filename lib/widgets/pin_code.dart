// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// class PinCodeWidget extends StatelessWidget {
//   final TextEditingController controller;
//   final int length;
//   final double? size;
//   final List<TextInputFormatter>? inputFormatters;
//   final TextInputType? keyboardType;
//   final bool capitalize;
//
//
//   const PinCodeWidget({
//     super.key,
//     required this.controller,
//     this.length = 4,
//     this.size,
//     this.inputFormatters,
//     this.keyboardType,
//     this.capitalize = false
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: size ?? SizeConfig.width,
//       child: Directionality(
//         textDirection: TextDirection.ltr,
//         child: Padding(
//           padding: EdgeInsetsDirectional.only(end: SizeConfig.height * 0.002),
//           child: PinCodeTextField(
//             appContext: context,
//             textStyle: TextStyle(
//               fontSize: SizeConfig.height * 0.018,
//               fontWeight: FontWeight.w400,
//             ),
//             length: length,
//             obscureText: false,
//             animationType: AnimationType.fade,
//             cursorColor: ColorConfig().primaryColor(1),
//             inputFormatters: inputFormatters ??[],
//             keyboardType: keyboardType ?? TextInputType.text,
//             textCapitalization: capitalize ? TextCapitalization.characters : TextCapitalization.none,
//
//             // validator: (String? v) =>Validators.validateOtp(value: v),
//             pinTheme:PinTheme(
//                 shape: PinCodeFieldShape.box,
//                 borderRadius: BorderRadius.circular(8),
//                 fieldHeight: SizeConfig.height * 0.0429,
//                 fieldWidth: SizeConfig.height * 0.0321,
//                 activeColor: ColorConfig().primaryColor(1),
//                 activeFillColor: Colors.white,
//                 selectedColor: ColorConfig().primaryColor(1),
//                 inactiveColor: ColorConfig().greyLightColor(1),
//                 inactiveFillColor: Colors.white,
//                 selectedFillColor: Colors.white,
//             ),
//             enablePinAutofill: true,
//             // errorAnimationController: ErrorAnimationType.shake,
//             errorTextMargin: const EdgeInsets.only(bottom: 0),
//             hintCharacter: "",
//             animationDuration: const Duration(milliseconds: 300),
//             backgroundColor: Colors.transparent,
//             enableActiveFill: true,
//             autoDisposeControllers: false,
//             controller: controller,
//             onChanged: (value) {},
//             beforeTextPaste: (text) {
//               return true;
//             },
//
//           ),
//         ),
//       ),
//     );
//   }
// }
