// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/decorations_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pinput/pinput.dart';
//
// class CustomPinPutWidget extends StatelessWidget {
//   final TextEditingController otpController;
//   final Function(String val) onChanged;
//   final Function(String val) onSubmit;
//   final FormFieldValidator<String> validator;
//   final bool enabled;
//
//   const CustomPinPutWidget({
//     Key? key,
//     required this.otpController,
//     required this.onChanged,
//     required this.onSubmit,
//     required this.validator,
//     required this.enabled,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Pinput(
//         defaultPinTheme: defaultPinTheme.copyWith(
//           textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
//               color: ColorConfig().greyColor(1),
//           ),
//         ),
//         focusedPinTheme: focusedPinTheme.copyWith(
//           textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
//               color: ColorConfig().blackColor(1),
//           ),
//         ),
//         submittedPinTheme: submittedPinTheme.copyWith(
//           textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
//               color: ColorConfig().blackColor(1),
//           ),
//         ),
//         disabledPinTheme: defaultPinTheme.copyWith(
//           textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
//               color: ColorConfig().blackColor(1),
//           ),
//         ),
//         preFilledWidget: Container(
//           height: SizeConfig.height * 0.001,
//           width: SizeConfig.height * 0.008,
//           color: ColorConfig().greyColor(0.5),
//         ),
//         pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//         keyboardAppearance: Brightness.light,
//         showCursor: true,
//         readOnly: !enabled,
//         controller: otpController,
//         autofocus: false,
//         enabled: enabled,
//         length: 4,
//         validator: validator,
//         keyboardType: TextInputType.number,
//         pinContentAlignment: Alignment.center,
//         listenForMultipleSmsOnAndroid: true,
//         closeKeyboardWhenCompleted: true,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         textInputAction: TextInputAction.done,
//         useNativeKeyboard: true,
//         pinAnimationType: PinAnimationType.scale,
//         enableSuggestions: false,
//         toolbarEnabled: false,
//         inputFormatters: [
//           FilteringTextInputFormatter.allow(RegExp("[٠-٩-0-9]"))
//         ],
//         onTap: () {},
//         onChanged: onChanged,
//         onSubmitted: onSubmit,
//       ),
//     );
//   }
// }
