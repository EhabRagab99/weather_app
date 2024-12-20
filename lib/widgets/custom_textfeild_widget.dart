import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/helpers/validations/credit_card_input_formatters/currency_text_input_formatter.dart';
import 'package:iem_app/helpers/validations/email_validatetors.dart';
import 'package:iem_app/utilites/app_size_config.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/default_text_widget.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFieldWidget extends StatefulWidget{
  final TextEditingController controller;
  final VoidCallback? onTap;
  final Function(String val)? onChanged;
  final FormFieldValidator? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? enabled;
  final bool? isPassword;
  final TextInputAction? textInputAction;
  final bool? autofocus;
  final bool? onlyNumber;
  final bool? allowArabic;
  final bool? withIcon;
  final String? icon;
  final bool? noBorder;
  final bool? withButtonIcon;
  final String? buttonIcon;
  final VoidCallback? buttonOnTap;
  final Color? buttonIconColor;
  final Color? borderColor;
  final double? iconSize;
  final double? buttonIconSize;
  final bool? obscureText;
  final bool? allowPaste;
  final bool? isBirthDate;
  final bool? allowEmoji;
  final bool? allowSpecial;
  final bool? isRequired;
  final double? borderRadiusValue, width, height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? allowNumber;
  final int? maxLength;
  final bool? allowCharAndWhiteSpace;
  final bool? allowJustCharactersWithNumbersAndSpace;
  final TextStyle? errorStyle;
  final bool? isMessageText;
  final TextCapitalization? textCapitalization;
  final bool? autocorrect;
  final bool? needsTranslation, filled;
  final InputBorder? inputBorder;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final TextStyle? style;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool? currencyFormatter;
  final bool? isPasswordField;
  final EdgeInsets? scrollPadding;
  final int? maxLine;
  final String? initialValue;
  final Function()? onSuffixTap;
  final bool? isDense;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final InputDecoration? decoration;
  final FocusNode? focusNode;
  final String? title;
  const CustomTextFieldWidget({
    super.key,
    this.onTap,
    this.maxLength,
    required this.controller,
    this.scrollPadding,
    this.onChanged,
    this.currencyFormatter=false,
    this.isPasswordField=false,
    this.isRequired=false,
    this.allowCharAndWhiteSpace=false,
    this.hintText,
    this.isPassword,
    this.keyboardType,
    this.enabled,
    this.textInputAction,
    this.validator,
    this.autofocus,
    this.onlyNumber,
    this.allowArabic,
    this.withButtonIcon,
    this.withIcon,
    this.icon,
    this.buttonIcon,
    this.buttonOnTap,
    this.buttonIconColor,
    this.iconSize,
    this.buttonIconSize,
    this.obscureText,
    this.allowPaste,
    this.isBirthDate,
    this.allowNumber,
    this.allowEmoji = false,
    this.allowSpecial = true,
    this.isMessageText = false,
    this.autocorrect=false,
    this.allowJustCharactersWithNumbersAndSpace=false,
    this.errorStyle,
    this.textCapitalization=TextCapitalization.sentences,
    this.suffixIcon,
    this.prefixIcon,
    this.borderColor,
    this.needsTranslation = true,
    this.inputFormatters,
    this.textDirection,
    this.style,
    this.filled = false,
    this.fillColor,
    this.contentPadding,
    this.noBorder,
    this.inputBorder,
    this.borderRadiusValue,
    this.width,
    this.height,
    this.maxLine,
    this.initialValue,
    this.onSuffixTap,
    this.isDense,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.decoration,
    this.focusNode,
    this.title,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  final FocusNode _focus = FocusNode();
  bool isFocus=false;
  bool hasNumber=false;
  bool hasLowerAndUppercase=false;
  bool hasSpecialChar=false;
  bool hasEightChar=false;
  int currentValueLength=0;
  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    widget.controller.addListener(onValueChange);
  }
  @override
  void dispose(){
    super.dispose();
    _focus.removeListener((){});
    _focus.dispose();
  }
  void _onFocusChange(){
    isFocus=_focus.hasFocus;
    if(mounted){
      setState(() {

      });
    }

  }
  void onValueChange() {
    currentValueLength=widget.controller.text.length;
    validationInPassword(widget.controller.text);
    if(mounted){
      setState(() {

      });
    }

  }
  validationInPassword(String value){
    if(EmailValidation.containsNumber(value)){
      hasNumber=true;
    }
    else{
      hasNumber=false;
    }
    if(EmailValidation.containsSpecialChar(value)){
      hasSpecialChar=true;
    }
    else{
      hasSpecialChar=false;
    }
    if(EmailValidation.containsUpperCaseLowerCase(value)){
      hasLowerAndUppercase=true;
    }
    else{
      hasLowerAndUppercase=false;
    }
    if(value.length>=8){
      hasEightChar=true;
    }
    else{
      hasEightChar=false;
    }
    if(mounted){
      // setState(() {
      //
      // });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        VisibleWidget(
          visible: widget.isRequired,
          child: Padding(
            padding: EdgeInsets.only(right: SizeConfig.height*.01),
            child: Image(
              height: SizeConfig.height*.01,
              width: SizeConfig.height*.01,
              color: ColorConfig().primaryColor(1 ),
              image: const AssetImage('assets/icons/astric.png'),
            ),
          ),
        ),
        VisibleWidget(
          visible: widget.isRequired,
          child: SizedBox(height: SizeConfig.height*.0030,
          ),
        ),
        VisibleWidget(
          visible: widget.title != null,
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextDefaultWidget(
              title: widget.title!,
              fontWeight: FontWeight.w600,
              fontSize: SizeConfig.height * 0.016,
            ),
          ),
        ),
        VisibleWidget(
          visible: widget.title != null,
          child: SizedBox(
            height: SizeConfig.height * 0.004,
          ),
        ),
        SizedBox(
          // height: SizeConfig.height * 0.05,
          child: TextFormField(
            scrollPadding:widget.scrollPadding??EdgeInsets.zero ,
            focusNode: widget.focusNode ??_focus,
            textDirection: widget.textDirection,
            maxLength: widget.maxLength,
            cursorHeight: SizeConfig.height * 0.02,
            keyboardAppearance: Brightness.light,
            onTap: widget.onTap,
            textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
            enabled: widget.enabled,
            onChanged:widget.onChanged,
            initialValue: widget.initialValue,
            autofocus: widget.autofocus ?? false,
            autocorrect: widget.autocorrect ?? true,
            obscureText: widget.obscureText ?? false,
            keyboardType: widget.keyboardType,
            obscuringCharacter: "●",
            textInputAction: widget.textInputAction,
            controller: widget.controller,
            validator: widget.validator,
            textAlign: TextAlign.start,
            maxLines: widget.isMessageText == true ? 4 : widget.maxLine ??1,
            style: widget.style ?? Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: SizeConfig.height * 0.017,
              color: ColorConfig().blackColor(widget.isBirthDate == true ? 0 : 1),
              fontWeight: FontWeight.w600,
            ),
            cursorColor: ColorConfig().primaryColor(1),
            inputFormatters:widget.inputFormatters ?? [
              if(widget.currencyFormatter == true)
                CurrencyTextInputFormatter(
                    enableNegative: false,
                    decimalDigits: 0,
                    symbol: " ${"SAR".tr}",
                    locale: "ar"
                ),
              if(widget.allowJustCharactersWithNumbersAndSpace == true)
                FilteringTextInputFormatter.allow(RegExp(r"[A-Za-z\u0621-\u064a0-9\s]+", unicode: true)),
              if (widget.onlyNumber == true)
                FilteringTextInputFormatter.allow(RegExp("[٠-٩0-9]")),
              if (widget.allowArabic == false)
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z-0-9 _ + @ - .]")),
              if (widget.isPassword == true || widget.keyboardType == TextInputType.emailAddress)
                FilteringTextInputFormatter.deny(RegExp(" ")),
              if (widget.allowEmoji == false)
                FilteringTextInputFormatter.deny(
                  RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
                ),
              if ( widget.allowNumber == false && widget.allowJustCharactersWithNumbersAndSpace == false)
                FilteringTextInputFormatter.deny(RegExp("[٠-٩0-9]")),
              if (widget.allowSpecial == false && widget.allowJustCharactersWithNumbersAndSpace == false)
              // FilteringTextInputFormatter.allow(RegExp("[A-Za-z\u0621-\u064a-\ ]", unicode: true)),
                FilteringTextInputFormatter.allow(RegExp("[A-Za-z\u0621-\u064a]", unicode: true)),
              if (widget.allowSpecial == false && widget.allowJustCharactersWithNumbersAndSpace== false)
                FilteringTextInputFormatter.deny(RegExp("[-]", unicode: true)),
              if (widget.allowCharAndWhiteSpace ==true)
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]+$'),)
            ],
            decoration: widget.decoration ??InputDecoration(
              counterText:widget.maxLength!=null&&isFocus? '${currentValueLength.toString()}/${widget.maxLength.toString()}':"",
              enabled: widget.enabled ?? true,
              errorMaxLines: 4,
              contentPadding: widget.contentPadding?? EdgeInsets.only(
                left: SizeConfig.height * 0.001,
                right: SizeConfig.height * 0.0,
                top: widget.withButtonIcon ==true
                    ? SizeConfig.height * 0.030
                    : SizeConfig.height * 0.004,
                bottom: SizeConfig.height * 0.004,
              ),
              hintText: widget.needsTranslation == true? widget.hintText?.tr : widget.hintText,
              filled: widget.filled,
              fillColor: widget.fillColor ?? ColorConfig().primaryColor(1),
              focusColor: ColorConfig().primaryColor(1),
              hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: SizeConfig.height * 0.014,
                color: ColorConfig().greyColor(1),
                fontWeight: FontWeight.normal,
              ),
              hoverColor: ColorConfig().primaryColor(1),
              border: widget.noBorder==true?InputBorder.none: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadiusValue ?? SizeConfig.height *0.01),
                  borderSide: BorderSide(color: widget.borderColor ?? ColorConfig().greyColor(1))),
              disabledBorder:widget.noBorder==true?InputBorder.none: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadiusValue ?? SizeConfig.height *0.01),
                  borderSide: BorderSide(color: widget.borderColor ?? ColorConfig().greyColor(1))),
              enabledBorder:widget.noBorder==true?InputBorder.none:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadiusValue ?? SizeConfig.height *0.01 ,),
                  borderSide: BorderSide(color: widget.borderColor ?? ColorConfig().greyColor(1))),
              errorBorder:widget.noBorder==true?InputBorder.none:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadiusValue ?? SizeConfig.height *0.01),
                  borderSide: BorderSide(color: widget.borderColor ?? ColorConfig().greyColor(1))),
              focusedErrorBorder: widget.noBorder==true?InputBorder.none:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadiusValue ?? SizeConfig.height *0.01),
                  borderSide: BorderSide(color: widget.borderColor ?? ColorConfig().greyColor(1))),
              focusedBorder:widget.noBorder==true?InputBorder.none:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadiusValue ?? SizeConfig.height *0.01),
                  borderSide: BorderSide(color: widget.borderColor ?? ColorConfig().greyColor(1))),
              errorStyle: widget.errorStyle ??
                  Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: ColorConfig().redColor(1),
                    fontWeight: FontWeight.w400,
                    height: SizeConfig.height * 0.0015,
                  ),
              floatingLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: ColorConfig().primaryColor(1),
                  fontWeight: FontWeight.w500,
                  height: 0.0),
              helperStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: ColorConfig().primaryColor(1),
                  fontWeight: FontWeight.w500,
                  height: 0.0),
              labelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: ColorConfig().primaryColor(1),
                  fontWeight: FontWeight.w500,
                  height: 0.0),
              suffixStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: ColorConfig().primaryColor(1),
                  fontWeight: FontWeight.w500,
                  height: 0.0),
              prefixStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: ColorConfig().primaryColor(1),
                  fontWeight: FontWeight.w500,
                  height: 0.0),
            prefixIcon: widget.prefixIcon == null ? SizedBox(width: SizeConfig.height *0.01) : SizedBox(width: SizeConfig.height *0.032, child: widget.prefixIcon),
            suffixIcon: widget.suffixIcon == null ? SizedBox(width: SizeConfig.height *0.004) : InkWell(onTap: widget.onSuffixTap, child: SizedBox(width: SizeConfig.height *0.032, child: widget.suffixIcon),),
            isDense: widget.isDense ?? false,
            prefixIconConstraints: BoxConstraints(minWidth: widget.prefixIcon == null ? 0 : SizeConfig.height *0.04, maxHeight: SizeConfig.height *0.023),
            suffixIconConstraints: BoxConstraints(minWidth: widget.suffixIcon == null ? 0 : SizeConfig.height *0.043, maxHeight: SizeConfig.height *0.043),

            ),
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            onSaved: widget.onSaved,
          ),
        ),
        // VisibleWidget(
        //   visible: widget.isPasswordField == true && isFocus,
        //   child: Column(
        //     children: [
        //       .015.heightBox,
        //       ValidationRowWidget(title: 'passwordCharLong', isActive: hasEightChar),
        //       .01.heightBox,
        //       ValidationRowWidget(title: 'capitalLetter', isActive: hasLowerAndUppercase),
        //       .01.heightBox,
        //       ValidationRowWidget(title: 'specialChar', isActive: hasSpecialChar),
        //       .01.heightBox,
        //       ValidationRowWidget(title: 'oneNumber', isActive: hasNumber),
        //       .024.heightBox,
        //     ],
        //   ),
        // ),
      ],
    );
  }
}



// class CustomTextFieldWidget extends StatelessWidget {
//   final TextEditingController? controller;
//   final bool? obscure;
//   final bool? readOnly;
//   final String? hint;
//   final String? initialValue;
//   final Color? backGroundColor;
//   final TextStyle? style;
//   final TextStyle? hintStyle;
//   final int? maxLine;
//   final int? prefixWidth;
//   final String? Function(String?)? validator;
//   final TextInputType? textInputType;
//   final bool? enable, isDense;
//   final Color? borderColor;
//   final double? borderRadiusValue, width, height;
//   final EdgeInsets? insidePadding;
//   final Widget? prefixIcon, suffixIcon;
//   final void Function(String)? onchange;
//   final void Function(String)? onFieldSubmitted;
//   final Function()? onSuffixTap;
//   final void Function()? onTap;
//   final List<TextInputFormatter>? formatter;
//   final TextInputAction? textInputAction;
//   final bool? noBorder;
// final TextDirection? textDirection;
//   const CustomTextFieldWidget({
//     Key? key,
//     this.isDense,
//     this.style,
//     this.onchange,
//     this.insidePadding,
//     this.validator,
//     this.maxLine,
//     this.hint,
//     this.initialValue,
//     this.backGroundColor,
//     this.controller,
//     this.obscure = false,
//     this.enable = true,
//     this.readOnly = false,
//     this.textInputType = TextInputType.text,
//     this.textInputAction,
//     this.borderColor,
//     this.borderRadiusValue,
//     this.prefixIcon,
//     this.width,
//     this.hintStyle,
//     this.suffixIcon,
//     this.onSuffixTap,
//     this.height,
//     this.onTap,
//     this.prefixWidth,
//     // this.noBorder = true,
//     this.formatter,
//     this.onFieldSubmitted,  this.textDirection, this.noBorder=false,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width ?? double.infinity,
//        height: height,
//       child: TextFormField(
//         // cursorHeight: 20.h,
//         readOnly: readOnly ?? false,
//         textAlignVertical: TextAlignVertical.center,
//         validator: validator,
//         onTap: () => onTap,
//         enabled: enable,
//         inputFormatters: formatter ?? [],
//         obscureText: obscure ?? false,
//         obscuringCharacter: obscure != null ? "*" : '',
//         textInputAction: textInputAction,
//         initialValue: initialValue,
//         controller: controller,
//         onFieldSubmitted: onFieldSubmitted,
//         decoration: InputDecoration(
//           errorStyle: const TextStyle(height: 0),
//           enabledBorder:noBorder==true?InputBorder.none: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadiusValue ?? SizeConfig.height *0.01),
//               borderSide: BorderSide(color: borderColor ?? ThemeClass.blackColor)),
//           disabledBorder: noBorder==true?InputBorder.none:OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadiusValue ?? SizeConfig.height *0.01),
//               borderSide: BorderSide(color: borderColor ?? ColorConfig().greyColor(1))),
//           focusedBorder:noBorder==true?InputBorder.none: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadiusValue ?? SizeConfig.height *0.01),
//               borderSide: BorderSide(color: borderColor ?? ColorConfig().primaryColor(1))),
//           border:noBorder==true?InputBorder.none: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadiusValue ?? SizeConfig.height *0.01),
//               borderSide: BorderSide(color: borderColor ?? ColorConfig().greyColor(1))),
//           isDense: isDense ?? false,
//           prefixIconConstraints: BoxConstraints(minWidth: prefixIcon == null ? 0 : 35.w, maxHeight: 20.w),
//           suffixIconConstraints: BoxConstraints(minWidth: suffixIcon == null ? 0 : 45.w, maxHeight: 40.h),
//           contentPadding: insidePadding ?? EdgeInsets.symmetric(vertical: 6.h),
//           fillColor: backGroundColor,
//           filled: backGroundColor != null,
//           hintText: hint,
//           prefixIcon: prefixIcon == null ? SizedBox(width: SizeConfig.height *0.01) : SizedBox(width: SizeConfig.height *0.032, child: prefixIcon),
//           suffixIcon: suffixIcon == null ? SizedBox(width: 5.w) : InkWell(onTap: onSuffixTap, child: SizedBox(width: SizeConfig.height *0.032, child: suffixIcon),),
//           isDense: isDense ?? false,
// //        prefixIconConstraints: BoxConstraints(minWidth: prefixIcon == null ? 0 : 35.w, maxHeight: 20.w),
//           suffixIconConstraints: BoxConstraints(minWidth: suffixIcon == null ? 0 : 45.w, maxHeight: 40.h),
//           hintStyle: hintStyle ??
//               TextStyle(
//                   fontSize: 12.sp,
//                   color: const Color(0xFFA5A5A5),
//                   fontWeight: FontWeight.w400),
//         ),
//         onChanged: onchange,
//         textCapitalization: TextCapitalization.words,
//         maxLines: maxLine ?? 1,
//         keyboardType: textInputType,
//         style: style ??
//             TextStyle(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w700,
//               color: ThemeClass.blackColor,
//             ),
//         cursorColor: ColorConfig().primaryColor(1),
//         onEditingComplete: (){
//           if(controller?.text.indexOf(' ',0)!=null){
//             controller?.text.replaceFirst(" ", '');
//           }
//         },
//       ),
//     );
//   }
// }

// class CustomTextFieldWidgetHome extends StatelessWidget {
//   final TextEditingController? controller;
//   final bool? obscure;
//   final bool? readOnly;
//   final String? hint;
//   final Color? backGroundColor;
//   final TextStyle? style;
//   final TextStyle? hintStyle;
//   final int? maxLine;
//   final String? Function(String?)? validator;
//   final TextInputType? textInputType;
//   final bool? enable, isDense,autofocus;
//   final Color? borderColor;
//   final double? borderRadiusValue, width, height;
//   final EdgeInsets? insidePadding;
//   final Widget? prefixIcon, suffixIcon;
//   final void Function(String)? onchange;
//   final void Function(String)? onFieldSubmitted;
//   final Function()? onSuffixTap;
//   final void Function()? onTap;
//   final List<TextInputFormatter>? formatter;
//   final TextInputAction? textInputAction;
//
//   const CustomTextFieldWidgetHome({
//     Key? key,
//     this.isDense,
//     this.style,
//     this.onchange,
//     this.insidePadding,
//     this.validator,
//     this.maxLine,
//     this.hint,
//     this.backGroundColor,
//     this.controller,
//     this.obscure = false,
//     this.enable = true,
//     this.readOnly = false,
//     this.textInputType = TextInputType.text,
//     this.textInputAction,
//     this.borderColor,
//     this.borderRadiusValue,
//     this.prefixIcon,
//     this.width,
//     this.hintStyle,
//     this.suffixIcon,
//     this.onSuffixTap,
//     this.height,
//     this.onTap,
//     this.formatter,
//     this.onFieldSubmitted, this.autofocus,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width ?? 350.w,
//       height: height ?? 52.h,
//       child: TextFormField(
//         // textDirection: TextDirection.rtl,
//         // cursorHeight: 20.h,
//         readOnly: readOnly ?? false,
//         textAlignVertical: TextAlignVertical.center,
//         validator: validator,
//         onTap: () => onTap,
//         enabled: enable,
//         inputFormatters: formatter ?? [],
//         obscureText: obscure ?? false,
//         obscuringCharacter: obscure != null ? "*" : '',
//         textInputAction: textInputAction,
//         controller: controller,
//         onFieldSubmitted: onFieldSubmitted,
//         autofocus: autofocus??false,
//         decoration: InputDecoration(
//           errorStyle: const TextStyle(height: 0),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadiusValue ?? 30.r),
//               borderSide:
//                   BorderSide(color: borderColor ?? ThemeClass.blackColor)),
//           disabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadiusValue ?? 30.r),
//               borderSide:
//                   BorderSide(color: borderColor ?? ColorConfig().greyColor(1))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadiusValue ?? 30.r),
//               borderSide:
//                   BorderSide(color: borderColor ?? ColorConfig().primaryColor(1))),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadiusValue ?? 30.r),
//               borderSide:
//                   BorderSide(color: borderColor ?? ColorConfig().greyColor(1))),
//           isDense: isDense ?? false,
//           prefixIconConstraints: BoxConstraints(
//               minWidth: prefixIcon == null ? 0 : 35.w, maxHeight: 20.w),
//           suffixIconConstraints: BoxConstraints(
//               minWidth: suffixIcon == null ? 0 : 45.w, maxHeight: 40.h),
//           contentPadding: insidePadding ?? EdgeInsets.symmetric(vertical: 6.h),
//           fillColor: backGroundColor,
//           filled: backGroundColor != null,
//           hintText: hint,
//           prefixIcon: prefixIcon == null
//               ? SizedBox(width: SizeConfig.height *0.01)
//               : SizedBox(width: SizeConfig.height *0.032, child: prefixIcon),
//           suffixIcon: suffixIcon == null
//               ? SizedBox(width: 5.w)
//               : InkWell(
//                   onTap: onSuffixTap,
//                   child: SizedBox(width: SizeConfig.height *0.032, child: suffixIcon),
//                 ),
//           hintStyle: hintStyle ??
//               TextStyle(
//                   fontSize: 14.sp,
//                   color: const Color(0xFF8A8B8D),
//                   fontWeight: FontWeight.w400),
//         ),
//         onChanged: onchange,
//         textCapitalization: TextCapitalization.words,
//         maxLines: maxLine ?? 1,
//         keyboardType: textInputType,
//         style: style ??
//             TextStyle(
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w600,
//               color: ThemeClass.blackColor,
//             ),
//         cursorColor: ColorConfig().primaryColor(1),
//       ),
//     );
//   }
// }
