import 'package:iem_app/helpers/app_localizations.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/decorations_config.dart';
import 'package:iem_app/helpers/validations/credit_card_input_formatters/currency_text_input_formatter.dart';
import 'package:iem_app/helpers/validations/email_validatetors.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:iem_app/widgets/custom_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomGenericSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  final TextInputAction textInputAction;
  final bool autofocus;
  final bool allowArabic;
  final bool? withIcon;
  final String? icon;
  final bool withButtonIcon;
  final String? buttonIcon;
  final Color? buttonIconColor;
  final double? iconSize;
  final double? buttonIconSize;
  final bool? allowEmoji;
  final bool? allowSpecial;
  final bool allowNumber;
  final bool allowJustCharactersWithNumbersAndSpace;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final bool autocorrect;
  final TextDirection? textDirection;
  final TextStyle? style;
  final Color? fillColor;
  final void Function()? onEditingComplete;
  final Function(String val)? onSubmitted;
  final Function(String? val)? onSaved;
  final Function(String val)? onChanged;
  final FormFieldValidator validator;
  final VoidCallback? onTap;
  final VoidCallback? suffixOnTap;
  final VoidCallback? buttonOnTap;

  const CustomGenericSearchField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.controller,
    this.buttonIcon,
    this.withIcon=true,
    this.withButtonIcon=false,
    this.buttonIconColor,
    this.iconSize,
    this.buttonIconSize,
    this.autofocus=false,
    this.allowNumber=true,
    this.allowArabic=true,
    this.maxLength,
    this.enabled=true,
    this.textInputAction=TextInputAction.next,
    this.allowEmoji = false,
    this.allowJustCharactersWithNumbersAndSpace = true,
    this.allowSpecial = true,
    this.autocorrect=false,
    this.textCapitalization=TextCapitalization.sentences,
    this.textDirection,
    this.style,
    this.fillColor,
    this.onEditingComplete,
    this.onSubmitted,
    this.onSaved,
    this.suffixOnTap,
    this.onTap,
    this.onChanged,
    this.buttonOnTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: textDirection,
      maxLength: maxLength,
      onTapOutside: (v)=>FocusManager.instance.primaryFocus?.unfocus(),
      cursorHeight: SizeConfig.height * 0.02,
      keyboardAppearance: Brightness.light,
      onTap: onTap,
      enabled: enabled,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onSubmitted,
      onSaved: onSaved,
      autofocus: autofocus,
      autocorrect: autocorrect,
      keyboardType: TextInputType.text,
      obscuringCharacter: "*",
      textInputAction: textInputAction,
      controller: controller,
      validator: validator,
      textAlign: TextAlign.start,
      maxLines: 1,
      style: style ?? Theme.of(context).textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.normal,
      ),
      cursorColor: ColorConfig().primaryColor(1),
      inputFormatters: [
        if (!allowArabic)
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z-0-9 _ + @ - .]")),
        if (!allowEmoji!)
          FilteringTextInputFormatter.deny(
            RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
          ),
        if (!allowNumber&!allowJustCharactersWithNumbersAndSpace) FilteringTextInputFormatter.deny(RegExp("[٠-٩0-9]")),
        if (!allowSpecial!&!allowJustCharactersWithNumbersAndSpace)
        // FilteringTextInputFormatter.allow(RegExp("[A-Za-z\u0621-\u064a-\ ]", unicode: true)),
          FilteringTextInputFormatter.allow(RegExp("[A-Za-z\u0621-\u064a]", unicode: false)),
        if (!allowSpecial!&!allowJustCharactersWithNumbersAndSpace)
          FilteringTextInputFormatter.deny(RegExp("[-]", unicode: false)),
      ],
      decoration: InputDecoration(
        enabled: enabled,
        errorMaxLines: 4,
        contentPadding: EdgeInsets.only(
          left: SizeConfig.height * 0.025,
          right: SizeConfig.height * 0.025,
        ),
        hintText:hintText,
        fillColor: fillColor ??ColorConfig().primaryColor(0.1),
        focusColor: ColorConfig().primaryColor(1),
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorConfig().blackColor(.5),),
        hoverColor: ColorConfig().primaryColor(1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(SizeConfig.height*0.017), borderSide: BorderSide(color:ColorConfig().redColor(0.6), width: 0.5),),
        disabledBorder: loginFieldsBorder,
        enabledBorder: loginFieldsBorder,
        errorBorder: loginFieldsBorder,
        focusedErrorBorder:  loginFocusedFieldsBorder,
        focusedBorder: loginFocusedFieldsBorder,
        errorStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorConfig().primaryColor(1), fontWeight: FontWeight.w400, height: SizeConfig.height * 0.0015,),
        floatingLabelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorConfig().primaryColor(1), fontWeight: FontWeight.w500, height: 0.0),
        helperStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorConfig().primaryColor(1), fontWeight: FontWeight.w500, height: 0.0),
        labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorConfig().primaryColor(1), fontWeight: FontWeight.w500, height: 0.0),
        suffixStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorConfig().primaryColor(1), fontWeight: FontWeight.w500, height: 0.0),
        prefixStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorConfig().primaryColor(1), fontWeight: FontWeight.w500, height: 0.0),
        // left
        prefixIcon: buildFieldIcon(
          context: context,
          prefixIcon: true,
          buttonIcon: buttonIcon!,
          icon: icon!,
          withButtonIcon: withButtonIcon,
          withIcon: withIcon!,
          buttonOnTap: buttonOnTap!,
          buttonIconColor: ColorConfig().greyColor(1),
          iconSize: iconSize??SizeConfig.height*0.02,
          buttonIconSize:buttonIconSize?? SizeConfig.height*0.02,
        ),
        // button icon
        suffixIcon: buildFieldIcon(
          prefixIcon: false,
          context: context,
          buttonIcon: buttonIcon!,
          icon: icon!,
          withButtonIcon: withButtonIcon,
          withIcon: withIcon!,
          buttonOnTap: buttonOnTap!,
          buttonIconColor: ColorConfig().greyColor(1),
          iconSize: iconSize??SizeConfig.height*0.02,
          buttonIconSize:buttonIconSize?? SizeConfig.height*0.02,
        ),
      ),
    );
  }
}


class CustomLoginTextField extends StatefulWidget{
  final int minLines;
  final int maxLines;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final Function(bool value)? passwordIsValidate;
  final bool enabled;
  final bool isPassword;
  final TextInputAction textInputAction;
  final bool autofocus;
  final bool onlyNumber;
  final bool allowArabic;
  final bool? withIcon;
  final String? icon;
  final bool withButtonIcon;
  final String? buttonIcon;
 final Color? buttonIconColor;
  final double? iconSize;
  final double? buttonIconSize;
  final bool obscureText;
  final bool allowPaste;
  final bool isBirthDate;
  final bool? allowEmoji;
  final bool? allowSpecial;
  final Widget? suffixWidget;
  final String? suffixIcon;
  final bool isRequired;
  final Widget? prefixIcon;
  final bool allowNumber;
  final int? maxLength;
  final bool allowCharAndWhiteSpace;
  final bool allowJustCharactersWithNumbersAndSpace;
  final TextStyle? errorStyle;
  final bool isMessageText;
  final TextCapitalization textCapitalization;
  final bool autocorrect;
  final bool? needsTranslation, filled;
  final InputBorder? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final TextStyle? style;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool currencyFormatter;
  final EdgeInsets? scrollPadding;
  final void Function()? onEditingComplete;
  final Function(String val)? onSubmitted;
  final Function(String? val)? onSaved;
  final Function(String val)? onChanged;
  final FormFieldValidator validator;
  final VoidCallback? onTap;
  final VoidCallback? suffixOnTap;
  final VoidCallback? buttonOnTap;
  final double? suffixIconHeight;
  final double? suffixIconWidth;

  const CustomLoginTextField({
    super.key,
    required this.hintText,
    this.minLines=1,
    this.maxLines=1,
    this.passwordIsValidate,
    required this.validator,
    required this.controller,
    this.buttonIcon,
    this.withIcon=true,
    this.withButtonIcon=false,
    this.buttonIconColor,
    this.iconSize,
    this.buttonIconSize,
    this.obscureText=false,
    this.autofocus=false,
    this.allowPaste=true,
    this.isBirthDate=false,
    this.allowNumber=true,
    this.onlyNumber=false,
    this.allowArabic=true,
    this.maxLength,
    this.scrollPadding,
    this.currencyFormatter=false,
    this.isRequired=false,
    this.allowCharAndWhiteSpace=false,
    this.isPassword=false,
    this.keyboardType=TextInputType.text,
    this.enabled=true,
    this.textInputAction=TextInputAction.next,
    this.allowEmoji = false,
    this.allowSpecial = true,
    this.isMessageText = false,
    this.autocorrect=false,
    this.allowJustCharactersWithNumbersAndSpace=false,
    this.errorStyle,
    this.textCapitalization=TextCapitalization.sentences,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.needsTranslation = true,
    this.inputFormatters,
    this.textDirection,
    this.style,
    this.filled = false,
    this.fillColor,
    this.contentPadding,
    this.onEditingComplete,
    this.suffixWidget,
    this.onSubmitted,
    this.onSaved,
    this.suffixOnTap,
    this.onTap,
    this.onChanged,
    this.buttonOnTap,
    this.icon,
    this.suffixIconHeight,
    this.suffixIconWidth,

  });

  @override
  State<CustomLoginTextField> createState() => _CustomLoginTextFieldState();
}

class _CustomLoginTextFieldState extends State<CustomLoginTextField> {
  final FocusNode _focus = FocusNode();
  bool isFocus = false;
  bool hasNumber = false;
  bool hasLowerAndUppercase = false;
  bool hasSpecialChar = false;
  bool hasEightChar = false;
  int currentValueLength = 0;
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
      setState((){

      });
    }
  }

  void onValueChange() {
    currentValueLength = widget.controller.text.length;
    if(widget.isPassword){
      validationInPassword(widget.controller.text);
      if( widget.passwordIsValidate!=null){
        widget.passwordIsValidate!(hasNumber&&hasSpecialChar&&hasLowerAndUppercase&&hasEightChar);
      }

    }
    if (mounted) {
      setState(() {});
    }
  }


   validationInPassword(String value) {
    if (EmailValidation.containsNumber(value)) {
      hasNumber = true;
    } else {
      hasNumber = false;
    }
    if (EmailValidation.containsSpecialChar(value)) {
      hasSpecialChar = true;
    } else {
      hasSpecialChar = false;
    }
    if (EmailValidation.containsUpperCaseLowerCase(value)) {
      hasLowerAndUppercase = true;
    } else {
      hasLowerAndUppercase = false;
    }
    if (value.length >= 8) {
      hasEightChar = true;
    } else {
      hasEightChar = false;
    }
    if (mounted) {

      setState(() {});
    }

  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // VisibleWidget(
        //   visible: widget.isRequired,
        //   child: Padding(
        //     padding: EdgeInsets.only(right: SizeConfig.height * .01),
        //     child: Image(
        //       height: SizeConfig.height * .01,
        //       width: SizeConfig.height * .01,
        //       color: ColorConfig().primaryColor(1),
        //       image: const AssetImage('assets/icons/astric.png'),
        //     ),
        //   ),
        // ),
        // VisibleWidget(visible: widget.isRequired, child: SizedBox(height: SizeConfig.height*.0030,)),
        TextFormField(
          minLines: widget.minLines,
          scrollPadding: widget.scrollPadding ?? EdgeInsets.zero,
          focusNode: _focus,
          textDirection: widget.textDirection,
          maxLength: widget.maxLength,
          cursorHeight: SizeConfig.height * 0.02,
          keyboardAppearance: Brightness.light,
          onTap: widget.onTap,
          textCapitalization: widget.textCapitalization,
          enabled: widget.enabled,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onSubmitted,
          onSaved: widget.onSaved,
          autofocus: widget.autofocus,
          autocorrect: widget.autocorrect,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          obscuringCharacter: "*",
          textInputAction: widget.textInputAction,
          controller: widget.controller,
          validator: widget.validator,
          textAlign: TextAlign.start,
          maxLines:widget.maxLines,
          style: widget.style ?? Theme.of(context).textTheme.titleMedium,
          cursorColor: ColorConfig().primaryColor(1),
          inputFormatters:widget.inputFormatters ?? [
            if(widget.currencyFormatter)
              CurrencyTextInputFormatter(
                  enableNegative: false,
                  decimalDigits: 0,
                  // symbol: " ${UserDataFromStorage.currencyCodeFromStorage}",
                  locale: "ar"
              ),
            if(widget.allowJustCharactersWithNumbersAndSpace) FilteringTextInputFormatter.allow(RegExp(r"[A-Za-z\u0621-\u064a0-9\s]+", unicode: true)),
            if (widget.onlyNumber) FilteringTextInputFormatter.allow(RegExp("[٠-٩0-9]")),
            if (!widget.allowArabic)
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z-0-9 _ + @ - .]")),
            if (widget.isPassword || widget.keyboardType == TextInputType.emailAddress)
              FilteringTextInputFormatter.deny(RegExp(" ")),
            if (!widget.allowEmoji!)
              FilteringTextInputFormatter.deny(
                RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
              ),
            if (!widget.allowNumber&!widget.allowJustCharactersWithNumbersAndSpace) FilteringTextInputFormatter.deny(RegExp("[٠-٩0-9]")),
            if (!widget.allowSpecial!&!widget.allowJustCharactersWithNumbersAndSpace)
            // FilteringTextInputFormatter.allow(RegExp("[A-Za-z\u0621-\u064a-\ ]", unicode: true)),
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z\u0621-\u064a]", unicode: true)),
            if (!widget.allowSpecial!&!widget.allowJustCharactersWithNumbersAndSpace)
              FilteringTextInputFormatter.deny(RegExp("[-]", unicode: true)),
            if (widget.allowCharAndWhiteSpace)
              FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]+$'),)
          ],
          decoration: InputDecoration(
            counterText: widget.maxLength !=null && isFocus ? '${currentValueLength.toString()}/${widget.maxLength.toString()}':"",
            enabled: widget.enabled,
            errorMaxLines: 4,
            contentPadding: widget.contentPadding ?? EdgeInsets.only(
              left: SizeConfig.height * 0.025,
              right: SizeConfig.height * 0.025,
              // top: widget.withButtonIcon? SizeConfig.height * 0.030 : SizeConfig.height * 0.030,
              // bottom: SizeConfig.height * 0.0,
            ),
            hintText: widget.needsTranslation == true? widget.hintText.tr : widget.hintText,
            filled: widget.filled,
            fillColor: widget.fillColor ??ColorConfig().primaryColor(0.1),
            focusColor: ColorConfig().primaryColor(1),
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorConfig().blackColor(.5),),
            hoverColor: ColorConfig().primaryColor(1),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(SizeConfig.height*0.017), borderSide: BorderSide(color:ColorConfig().redColor(0.6), width: 0.5),),
            disabledBorder:widget.borderColor ?? loginFieldsBorder,
            enabledBorder:widget.borderColor ?? loginFieldsBorder,
            errorBorder:widget.borderColor ?? loginFieldsBorder,
            focusedErrorBorder: widget.borderColor ?? loginFocusedFieldsBorder,
            focusedBorder:widget.borderColor ?? loginFocusedFieldsBorder,
            errorStyle: widget.errorStyle ?? Theme.of(context).textTheme.labelSmall!.copyWith(color: ColorConfig().primaryColor(1), fontWeight: FontWeight.w400, height: SizeConfig.height * 0.0015,),
            floatingLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: ColorConfig().primaryColor(1), fontWeight: FontWeight.w500, height: 0.0),
            helperStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: ColorConfig().primaryColor(1), fontWeight: FontWeight.w500, height: 0.0),
            labelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: ColorConfig().primaryColor(1), fontWeight: FontWeight.w500, height: 0.0),
            suffixStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: ColorConfig().primaryColor(1), fontWeight: FontWeight.w500, height: 0.0),
            prefixStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: ColorConfig().primaryColor(1), fontWeight: FontWeight.w500, height: 0.0),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon != null? InkWell(
              onTap: widget.suffixOnTap,
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: SizeConfig.height * .020, top: SizeConfig.height * .016, bottom: SizeConfig.height * .016),
                child: SizedBox(
                  child: SvgPicture.asset(
                    widget.suffixIcon!,
                    height: widget.suffixIconHeight,
                    width: widget.suffixIconWidth,
                    colorFilter: ColorFilter.mode(widget.buttonIconColor ?? ColorConfig().greyColor(1), BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ):null,
          ),
        ),
        // VisibleWidget(
        //   visible: widget.isPassword && isFocus,
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

class MinAndMaxCounterTextField extends StatelessWidget {
  final TextEditingController controller;

  final Function(String val) onChanged;

  const MinAndMaxCounterTextField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      onChanged: onChanged,
      controller: controller,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[٠-٩0-9]"))],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: SizeConfig.height * .004),
        border: InputBorder.none,
      ),
    );
  }
}

class LoginPhoneNumberTextField extends StatelessWidget {
  final TextEditingController controller;

  final VoidCallback countryOnTap;
  final String countryCode;
  final String hintText;
  final String countryFlag;
  final Function(String val) onChanged;
  final FormFieldValidator validator;
  final TextInputType keyboardType;
  final bool enabled;
  final TextInputAction textInputAction;

  final bool autofocus;
  final bool isRequired;
  final TextStyle hintStyle;
  final TextStyle textStyle;

  const LoginPhoneNumberTextField({
    super.key,
    required this.countryOnTap,
    required this.countryCode,
    this.isRequired=false,
    required this.controller,
    required this.onChanged,
    required this.hintText,
    required this.keyboardType,
    required this.enabled,
    required this.textInputAction,
    required this.validator,
    required this.autofocus,
    required this.countryFlag,
    required this.hintStyle,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Visibility(
          visible: isRequired,
          child: Padding(
            padding:  EdgeInsets.only(right: SizeConfig.height*.01),
            child: Image(
              height: SizeConfig.height*.01,
              width: SizeConfig.height*.01,
              color: ColorConfig().primaryColor(1),
              image: const AssetImage('assets/icons/astric.png'),
            ),
          ),
        ),
        Visibility(
            visible: isRequired,
            child: SizedBox(height: SizeConfig.height*.0030,)),
        TextFormField(
          textCapitalization: TextCapitalization.sentences,
          cursorHeight: SizeConfig.height * 0.02,
          keyboardAppearance: Brightness.light,
          onChanged: onChanged,
          autofocus: autofocus,
          autocorrect: false,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          controller: controller,
          validator: validator,
          textAlign: AppLocalizations.of(context)!.locale.languageCode == "ar"
              ? TextAlign.end
              : TextAlign.start,
          maxLines: 1,
          style: textStyle,
          cursorColor: ColorConfig().primaryColor(1),
          enabled: enabled,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[٠-٩0-9]"))],
          decoration: InputDecoration(
            enabled: true,
            contentPadding: EdgeInsets.only(
              left: SizeConfig.height * 0.02,
              right: SizeConfig.height * 0.02,
              top: SizeConfig.height * 0.033,
              bottom: SizeConfig.height * 0.0,
            ),
            hintText: hintText,
            filled: false,
            fillColor: ColorConfig().primaryColor(0.1),
            focusColor: ColorConfig().primaryColor(1),
            hintStyle: hintStyle,
            hoverColor: ColorConfig().primaryColor(1),
            border: loginFieldsBorder,
            disabledBorder: loginFieldsBorder,
            enabledBorder: loginFieldsBorder,
            errorBorder: loginFieldsBorder,
            focusedErrorBorder: loginFieldsBorder,
            focusedBorder: loginFocusedFieldsBorder,
            errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.w500,
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
            suffixIcon: buildPhoneFieldCode(
                context: context,
                prefixIcon: false,
                buttonOnTap: countryOnTap,
                countryCode: countryCode,
                countryFlag: countryFlag,
                textStyle: textStyle),
            prefixIcon: buildPhoneFieldCode(
                context: context,
                prefixIcon: true,
                buttonOnTap: countryOnTap,
                countryCode: countryCode,
                countryFlag: countryFlag,
                textStyle: textStyle),
          ),
        ),
      ],
    );
  }
}

class CustomLoginSearchField extends StatelessWidget {
  final int minLines;
  final TextEditingController controller;

  final VoidCallback onTap;
  final Function(String val) onChanged;
  final Function(String val) onSubmitted;
  final VoidCallback onEditingComplete;
  final String hintText;
  final bool enabled;

  final bool autofocus;

  final bool showCloseIcon;

  final bool isRequired;

  final void Function() iconOnTap;
  final TextInputAction textInputAction;

  const CustomLoginSearchField({
    super.key,
    required this.onTap,
    required this.controller,
     this.minLines=1,
    required this.onChanged,
    this.isRequired=false,
    required this.hintText,
    required this.onEditingComplete,
    required this.enabled,
    required this.onSubmitted,
    required this.autofocus,
    required this.showCloseIcon,
    required this.iconOnTap,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Visibility(
          visible: isRequired,
          child: Padding(
            padding:  EdgeInsets.only(right: SizeConfig.height*.01),
            child: Image(
              height: SizeConfig.height*.01,
              width: SizeConfig.height*.01,
              color: ColorConfig().primaryColor(1),
              image: const AssetImage('assets/icons/astric.png'),
            ),
          ),
        ),
        Visibility(
            visible: isRequired,
            child: SizedBox(height: SizeConfig.height*.0030,)),
        TextFormField(
          minLines: minLines,
          textCapitalization: TextCapitalization.sentences,
          onTap: onTap,
          cursorHeight: SizeConfig.height * 0.02,
          keyboardAppearance: Brightness.light,
          autocorrect: autofocus,
          onChanged: onChanged,
          autofocus: autofocus,
          enabled: enabled,
          onFieldSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
          keyboardType: TextInputType.text,
          textInputAction: textInputAction,
          onSaved: (b) {},
          cursorColor: ColorConfig().primaryColor(1),
          controller: controller,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: ColorConfig().primaryColor(1),
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            isDense: false,
            border: loginFieldsBorder.copyWith(
                borderSide: BorderSide(
                  color: ColorConfig().primaryColor(1),
                )),
            disabledBorder: loginFieldsBorder.copyWith(
                borderSide: BorderSide(
                  color: ColorConfig().primaryColor(1),
                )),
            enabledBorder: loginFieldsBorder.copyWith(
                borderSide: BorderSide(
                  color: ColorConfig().primaryColor(1),
                )),
            errorBorder: loginFieldsBorder,
            focusedErrorBorder: loginFieldsBorder,
            focusedBorder: loginFocusedFieldsBorder,
            fillColor: ColorConfig().primaryColor(0.2),
            prefixIcon: Container(
              margin: EdgeInsets.only(
                left: SizeConfig.height * 0.01849,
                right: SizeConfig.height * 0.01849,
              ),
              child: CustomIconButton(
                icon: 'search_icon',
                size: SizeConfig.height * 0.02,
                onTap: iconOnTap,
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: SizeConfig.height * 0.01,
              bottom: SizeConfig.height * 0.01,
              left: SizeConfig.height * 0.02773,
              right: SizeConfig.height * 0.02773,
            ),
            hintText: hintText,
            focusColor: ColorConfig().primaryColor(1),
            hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.normal,
            ),
            hoverColor: ColorConfig().primaryColor(1),
          ),
          cursorWidth: 1,
          maxLines: 1,
        ),
      ],
    );
  }
}

class CustomSeekerJobSearchField extends StatelessWidget {
  final TextEditingController controller;

  final VoidCallback onTap;
  final Function(String val) onChanged;
  final Function(String val) onSubmitted;
  final VoidCallback onEditingComplete;
  final String hintText;
  final bool enabled;

  final bool autofocus;

  final bool showCloseIcon;

  final bool isRequired;

  final void Function() iconOnTap;
  final TextInputAction textInputAction;

  const CustomSeekerJobSearchField({
    super.key,
    required this.onTap,
    this.isRequired=false,
    required this.controller,
    required this.onChanged,
    required this.hintText,
    required this.onEditingComplete,
    required this.enabled,
    required this.onSubmitted,
    required this.autofocus,
    required this.showCloseIcon,
    required this.iconOnTap,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Visibility(
          visible: isRequired,
          child: Padding(
            padding:  EdgeInsets.only(right: SizeConfig.height*.01),
            child: Image(
              height: SizeConfig.height*.01,
              width: SizeConfig.height*.01,
              color: ColorConfig().primaryColor(1),
              image: const AssetImage('assets/icons/astric.png'),
            ),
          ),
        ),
        Visibility(visible: isRequired, child: SizedBox(height: SizeConfig.height*.0030,)),

        TextFormField(
          onTap: onTap,
          cursorHeight: SizeConfig.height * 0.02,
          keyboardAppearance: Brightness.light,
          autocorrect: autofocus,
          onChanged: onChanged,
          autofocus: autofocus,
          enabled: enabled,
          onFieldSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
          keyboardType: TextInputType.text,
          textInputAction: textInputAction,
          onSaved: (b) {},
          cursorColor: ColorConfig().primaryColor(1),
          controller: controller,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: ColorConfig().primaryColor(1),
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            isDense: false,
            border: loginFieldsBorder.copyWith(
              borderSide: BorderSide(color: ColorConfig().primaryColor(1)),
              borderRadius: BorderRadius.circular(SizeConfig.height * 0.018),
            ),
            disabledBorder: loginFieldsBorder.copyWith(
              borderSide: BorderSide(
                color: ColorConfig().primaryColor(1),
              ),
              borderRadius: BorderRadius.circular(SizeConfig.height * 0.018),
            ),
            enabledBorder: loginFieldsBorder.copyWith(
              borderSide: BorderSide(
                color: ColorConfig().primaryColor(1),
              ),
              borderRadius: BorderRadius.circular(SizeConfig.height * 0.018),
            ),
            errorBorder: loginFieldsBorder.copyWith(
              borderRadius: BorderRadius.circular(SizeConfig.height * 0.018),
            ),
            focusedErrorBorder: loginFieldsBorder.copyWith(
              borderRadius: BorderRadius.circular(SizeConfig.height * 0.018),
            ),
            focusedBorder: loginFocusedFieldsBorder.copyWith(
              borderRadius: BorderRadius.circular(SizeConfig.height * 0.018),
            ),
            fillColor: ColorConfig().primaryColor(0.2),
            prefixIcon: Container(
              margin: EdgeInsets.only(
                left: SizeConfig.height * 0.01849,
                right: SizeConfig.height * 0.01849,
              ),
              child: CustomIconButton(
                icon: 'search_icon',
                size: SizeConfig.height * 0.02,
                onTap: iconOnTap,
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: SizeConfig.height * 0.01,
              bottom: SizeConfig.height * 0.01,
              left: SizeConfig.height * 0.02773,
              right: SizeConfig.height * 0.02773,
            ),
            hintText: hintText,
            focusColor: ColorConfig().primaryColor(1),
            hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.normal,
            ),
            hoverColor: ColorConfig().primaryColor(1),
          ),
          cursorWidth: 1,
          maxLines: 1,
        ),
      ],
    );
  }
}

class DescriptionBigTextField extends StatelessWidget {
  final TextEditingController controller;

  final VoidCallback onTap;
  final Function(String val) onChanged;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final bool enabled;

  final int minLines;

  final int? maxLength;
  final int maxLines;

  final Color backgroundColor;

  final TextInputAction textInputAction;

  final bool? autofocus;

  final bool? withCounter;

  final FormFieldValidator validator;
  final bool withHelperText;

  final String topHelperText;

  final bool isRequired;

  final bool autoCorrect;
 final TextCapitalization textCapitalization;
  const DescriptionBigTextField({
    super.key,
    required this.onTap,
    this.maxLength,
    required this.controller,
    this.isRequired=false,
    required this.onChanged,
    required this.hintText,
    required this.hintStyle,
    required this.textStyle,
    required this.enabled,
    required this.maxLines,
    required this.minLines,
    required this.backgroundColor,
    required this.textInputAction,
    required this.validator,
    required this.topHelperText,
    required this.withHelperText,
    this.autofocus = false,
    this.withCounter = false,
    this.autoCorrect=false,
    this.textCapitalization=TextCapitalization.sentences,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Visibility(
          visible: isRequired,
          child: Padding(
            padding:  EdgeInsets.only(right: SizeConfig.height*.01),
            child: Image(
              height: SizeConfig.height*.01,
              width: SizeConfig.height*.01,
              color: ColorConfig().primaryColor(1),
              image: const AssetImage('assets/icons/astric.png'),
            ),
          ),
        ),

        Visibility(visible: isRequired, child: SizedBox(height: SizeConfig.height*.0030,),),

        TextFormField(
          textCapitalization: textCapitalization,
          enableSuggestions: false,
          maxLength: maxLength,
          onTap: onTap,
          autocorrect: autoCorrect,
          onChanged: onChanged,
          autofocus: autofocus!,
          enabled: enabled,
          keyboardType: TextInputType.multiline,
          textInputAction: textInputAction,
          controller: controller,
          textAlign: TextAlign.start,
          minLines: minLines,
          maxLines: maxLines,
          validator: validator,
          keyboardAppearance: Brightness.light,
          style: textStyle,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
            ),
          ],
          decoration: InputDecoration(
            isDense: false,
            counterText: withCounter! ? AppLocalizations.of(context)!.translate("jobDescriptionCharacter").toString() : null,
            counterStyle: withCounter! ? Theme.of(context).textTheme.labelSmall!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.normal,
            ) : null,
            border: commentFieldBoxDecoration,
            fillColor: ColorConfig().primaryColor(0.2),
            enabledBorder: commentFieldBoxDecoration,
            focusedBorder: commentFocusedFieldBoxDecoration,
            focusedErrorBorder: commentFieldBoxDecoration,
            errorBorder: commentFieldBoxDecoration,
            disabledBorder: commentFieldBoxDecoration,
            labelStyle: hintStyle,
            floatingLabelStyle: withHelperText ? Theme.of(context).textTheme.displayMedium!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.w400,
            ) : null,
            labelText: withHelperText ? AppLocalizations.of(context)!.translate(topHelperText).toString() : null,
            contentPadding: EdgeInsets.only(
              top: SizeConfig.height * 0.02,
              bottom: SizeConfig.height * 0.02,
              left: SizeConfig.height * 0.02,
              right: SizeConfig.height * 0.02,
            ),
            hintText: AppLocalizations.of(context)!.translate(hintText).toString(),
            helperStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.w500,
              height: 0.0,
            ),
            suffixStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.w500,
              height: 0.0,
            ),
            prefixStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.w500,
              height: 0.0,
            ),
            errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.w500,
            ),
            focusColor: ColorConfig().primaryColor(1),
            hintStyle: hintStyle,
            hoverColor: ColorConfig().primaryColor(1),
          ),
          cursorColor: ColorConfig().primaryColor(1),
          cursorHeight: SizeConfig.height * 0.018,
        ),
      ],
    );
  }
}

class CustomPromoCodeTextField extends StatelessWidget{
  final TextEditingController controller;
  final VoidCallback onTap;
  final Function(String val) onChanged;
  final FormFieldValidator validator;
  final String hintText;
  final TextInputType keyboardType;
  final bool enabled;
  final bool isPassword;
  final TextInputAction textInputAction;
  final bool autofocus;
  final bool onlyNumber;
  final bool allowArabic;
  final bool? withIcon;
  final String? icon;

  final bool? withButtonIcon;
  final String? buttonIcon;

  final VoidCallback? buttonOnTap;

  final Color buttonIconColor;
  final double iconSize;

  final double buttonIconSize;

  final bool obscureText;

  final bool allowPaste;

  final bool isBirthDate;

  final bool? allowEmoji;

  final bool? allowSpecial;
  final bool isRequired;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool allowNumber;
  final int? maxLength;
  final bool? allowCharAndWhiteSpace;
  final bool allowJustCharactersWithNumbersAndSpace;
  final TextStyle? errorStyle;
  final bool isMessageText;
  final TextCapitalization textCapitalization;
  final bool autocorrect;
  final bool? needsTranslation, filled;
  final InputBorder? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final TextStyle? style;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool currencyFormatter;
  final bool isPasswordField;
  final EdgeInsets? scrollPadding;
  final void Function()? onEditingComplete;
  final Function(String val)? onSubmitted;
  final Function(String? val)? onSaved;

  const CustomPromoCodeTextField({
    super.key,
    required this.onTap,
    this.maxLength,
    required this.controller,
    this.scrollPadding,
    required this.onChanged,
    this.currencyFormatter=false,
    this.isPasswordField=false,
    this.isRequired=false,
    this.allowCharAndWhiteSpace=false,
    required this.hintText,
    required this.isPassword,
    required this.keyboardType,
    required this.enabled,
    required this.textInputAction,
    required this.validator,
    required this.autofocus,
    required this.onlyNumber,
    required this.allowArabic,
    required this.withButtonIcon,
    required this.withIcon,
    required this.icon,
    required this.buttonIcon,
    required this.buttonOnTap,
    required this.buttonIconColor,
    required this.iconSize,
    required this.buttonIconSize,
    required this.obscureText,
    required this.allowPaste,
    required this.isBirthDate,
    required this.allowNumber,
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
    this.onEditingComplete,
    this.onSubmitted, this.onSaved

  });

  @override


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          scrollPadding:scrollPadding ?? EdgeInsets.zero,

          textDirection:textDirection,
          maxLength:maxLength,
          cursorHeight: SizeConfig.height * 0.02,
          keyboardAppearance: Brightness.light,
          onTap:onTap,

          textCapitalization:textCapitalization,
          enabled:enabled,
          onChanged:onChanged,
          onEditingComplete:onEditingComplete,
          onFieldSubmitted:onSubmitted,
          onSaved:onSaved,
          autofocus:autofocus,
          autocorrect:autocorrect,
          obscureText:obscureText,
          keyboardType:keyboardType,
          obscuringCharacter: "●",
          textInputAction:textInputAction,
          controller:controller,
          validator:validator,
          textAlign: TextAlign.start,
          maxLines:isMessageText ? 4 : 1,
          style:style ?? Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: ColorConfig().greyColor(isBirthDate ? 0 : 1),
            fontWeight: FontWeight.w400,
          ),

          cursorColor: ColorConfig().primaryColor(1),
          inputFormatters:inputFormatters ?? [
            if(currencyFormatter)
              CurrencyTextInputFormatter(
                  enableNegative: false,
                  decimalDigits: 0,
                  // symbol: " ${UserDataFromStorage.currencyCodeFromStorage}",
                  locale: "ar"
              ),
            if(allowJustCharactersWithNumbersAndSpace) FilteringTextInputFormatter.allow(RegExp(r"[A-Za-z\u0621-\u064a0-9\s]+", unicode: true)),
            if (onlyNumber) FilteringTextInputFormatter.allow(RegExp("[٠-٩0-9]")),
            if (allowArabic)
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z-0-9 _ + @ - .]")),
            if (isPassword ||keyboardType == TextInputType.emailAddress)
              FilteringTextInputFormatter.deny(RegExp(" ")),
            if (!allowEmoji!)
              FilteringTextInputFormatter.deny(
                RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
              ),
            if (allowNumber&allowJustCharactersWithNumbersAndSpace) FilteringTextInputFormatter.deny(RegExp("[٠-٩0-9]")),
            if (!allowSpecial!&!allowJustCharactersWithNumbersAndSpace)
            // FilteringTextInputFormatter.allow(RegExp("[A-Za-z\u0621-\u064a-\ ]", unicode: true)),
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z\u0621-\u064a]", unicode: true)),
            if (!allowSpecial!&!allowJustCharactersWithNumbersAndSpace)
              FilteringTextInputFormatter.deny(RegExp("[-]", unicode: true)),
            if (allowCharAndWhiteSpace!)
              FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]+$'),)
          ],
          decoration: InputDecoration(

            enabled:enabled,
            errorMaxLines: 4,
            contentPadding:contentPadding?? EdgeInsets.only(
              left: SizeConfig.height * 0.025,
              right: SizeConfig.height * 0.025,
              top:withButtonIcon!
                  ? SizeConfig.height * 0.030
                  : SizeConfig.height * 0.030,
              bottom: SizeConfig.height * 0.0,
            ),
            hintText:needsTranslation == true? hintText.tr :hintText,
            filled:filled,
            fillColor:fillColor ??ColorConfig().primaryColor(0.1),
            focusColor: ColorConfig().primaryColor(1),
            hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: SizeConfig.height*.014,
              color: ColorConfig().greyColor(.7),
              fontWeight: FontWeight.normal,
            ),
            hoverColor: ColorConfig().primaryColor(1),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(SizeConfig.height*0.017),
              borderSide: BorderSide(
                color:ColorConfig().redColor(0.6),
                width: 0.5,
              ),
            ),
            disabledBorder:borderColor ?? loginFieldsBorder,
            enabledBorder:borderColor ?? loginFieldsBorder,
            errorBorder:borderColor ?? loginFieldsBorder,
            focusedErrorBorder:borderColor ?? loginFocusedFieldsBorder,
            focusedBorder:borderColor ?? loginFocusedFieldsBorder,
            errorStyle:errorStyle ??
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
            // left
            prefixIcon:prefixIcon,
            // button icon
            suffixIcon:suffixIcon,
          ),
        ),

      ],
    );
  }
}


// spell checker text field
// class SpellCheckerDescriptionBigTextField extends StatelessWidget {
//
//   final SpellCheckTextEditingController controller;
//   final VoidCallback onTap;
//   final String hintText;
//   final TextStyle hintStyle;
//   final TextStyle textStyle;
//   final bool enabled;
//
//   final int minLines;
//
//   final int? maxLength;
//   final int maxLines;
//
//   final Color backgroundColor;
//
//   final TextInputAction textInputAction;
//
//   final bool? autofocus;
//
//   final bool? withCounter;
//
//   final FormFieldValidator validator;
//   final bool withHelperText;
//   final String topHelperText;
//   final bool isRequired;
//   final bool autoCorrect;
//   final TextCapitalization textCapitalization;
//   final Function handleSpellCheck;
//   final Function(String val) handleOnChange;
//
//    const SpellCheckerDescriptionBigTextField({
//     Key? key,
//     required this.onTap,
//     this.maxLength,
//     required this.controller,
//     this.isRequired=false,
//     required this.hintText,
//     required this.hintStyle,
//     required this.textStyle,
//     required this.enabled,
//     required this.maxLines,
//     required this.minLines,
//     required this.backgroundColor,
//     required this.textInputAction,
//     required this.validator,
//     required this.topHelperText,
//     required this.withHelperText,
//     this.autofocus = false,
//     this.withCounter = false,
//     this.autoCorrect=false,
//     this.textCapitalization=TextCapitalization.sentences,
//      required this.handleSpellCheck,
//      required this.handleOnChange,
//
//   }) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Visibility(
//           visible: isRequired,
//           child: Padding(
//             padding:  EdgeInsets.only(right: SizeConfig.height*.01),
//             child: Image(
//               height: SizeConfig.height*.01,
//               width: SizeConfig.height*.01,
//               color: ColorConfig().primaryColor(1),
//               image: const AssetImage('assets/icons/astric.png'),
//             ),
//           ),
//         ),
//
//         Visibility(visible: isRequired, child: SizedBox(height: SizeConfig.height*.0030,),),
//         Focus(
//           onFocusChange: (hasFocus) {
//             if (!hasFocus) {
//               handleSpellCheck;
//             }
//             },
//           child: TextFormField(
//             textCapitalization: textCapitalization,
//             maxLength: maxLength,
//             onTap: onTap,
//             autocorrect: autoCorrect,
//             onChanged:handleOnChange,
//             autofocus: autofocus!,
//             enabled: enabled,
//             keyboardType: TextInputType.multiline,
//             textInputAction: textInputAction,
//             controller: controller,
//             textAlign: TextAlign.start,
//             minLines: minLines,
//             maxLines: maxLines,
//             validator: validator,
//             keyboardAppearance: Brightness.light,
//             style: textStyle,
//             inputFormatters: [
//               FilteringTextInputFormatter.deny(
//                 RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
//               ),
//             ],
//             decoration: InputDecoration(
//               isDense: false,
//               counterText: withCounter! ? AppLocalizations.of(context)!.translate("jobDescriptionCharacter").toString() : null,
//               counterStyle: withCounter! ? Theme.of(context).textTheme.labelSmall!.copyWith(
//                 color: ColorConfig().primaryColor(1),
//                 fontWeight: FontWeight.normal,
//               ) : null,
//               border: commentFieldBoxDecoration,
//               fillColor: ColorConfig().primaryColor(0.2),
//               enabledBorder: commentFieldBoxDecoration,
//               focusedBorder: commentFocusedFieldBoxDecoration,
//               focusedErrorBorder: commentFieldBoxDecoration,
//               errorBorder: commentFieldBoxDecoration,
//               disabledBorder: commentFieldBoxDecoration,
//               labelStyle: hintStyle,
//               floatingLabelStyle: withHelperText ? Theme.of(context).textTheme.displayMedium!.copyWith(
//                 color: ColorConfig().primaryColor(1),
//                 fontWeight: FontWeight.w400,
//               ) : null,
//               labelText: withHelperText ? AppLocalizations.of(context)!.translate(topHelperText).toString() : null,
//               contentPadding: EdgeInsets.only(
//                 top: SizeConfig.height * 0.02,
//                 bottom: SizeConfig.height * 0.02,
//                 left: SizeConfig.height * 0.02,
//                 right: SizeConfig.height * 0.02,
//               ),
//               hintText: AppLocalizations.of(context)!.translate(hintText).toString(),
//               helperStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
//                 color: ColorConfig().primaryColor(1),
//                 fontWeight: FontWeight.w500,
//                 height: 0.0,
//               ),
//               suffixStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
//                 color: ColorConfig().primaryColor(1),
//                 fontWeight: FontWeight.w500,
//                 height: 0.0,
//               ),
//               prefixStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
//                 color: ColorConfig().primaryColor(1),
//                 fontWeight: FontWeight.w500,
//                 height: 0.0,
//               ),
//               errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
//                 color: ColorConfig().primaryColor(1),
//                 fontWeight: FontWeight.w500,
//               ),
//               focusColor: ColorConfig().primaryColor(1),
//               hintStyle: hintStyle,
//               hoverColor: ColorConfig().primaryColor(1),
//             ),
//             cursorColor: ColorConfig().primaryColor(1),
//             cursorHeight: SizeConfig.height * 0.018,
//           ),
//         ),
//       ],
//     );
//   }
//
//
// }

class CustomChatTextField extends StatelessWidget {
  final Function(String val) onChanged;
  final Function(String val) onSubmitted;
  final Function() onTap;
  final TextEditingController controller;
  final bool isRequired;

  final bool enableTextField;

  const CustomChatTextField({
    super.key,
    required this.enableTextField,
    this.isRequired=false,
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: SizeConfig.height * 0.01, left: SizeConfig.height * 0.01),
      decoration: BoxDecoration(
        color: ColorConfig().primaryColor(0.07),
        borderRadius: BorderRadius.circular(30,),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Visibility(
            visible: isRequired,
            child: Padding(
              padding:  EdgeInsets.only(right: SizeConfig.height*.01),
              child: Image(
                height: SizeConfig.height*.01,
                width: SizeConfig.height*.01,
                color: ColorConfig().primaryColor(1),
                image: const AssetImage('assets/icons/astric.png'),
              ),
            ),
          ),
          Visibility(visible: isRequired, child: SizedBox(height: SizeConfig.height*.0030,)),

          TextField(
            /// Auto-capitalization
            textCapitalization: TextCapitalization.sentences,
            controller: controller,
            autocorrect: true,
            cursorHeight: SizeConfig.height * 0.018,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            onTap: onTap,
            enabled: enableTextField,
            textInputAction: TextInputAction.newline,
            cursorColor: ColorConfig().primaryColor(0.1),
            textAlign: AppLocalizations.of(context)!.locale.languageCode == "ar"
                ? TextAlign.end
                : TextAlign.start,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.w500,
            ),
            maxLines: 4,
            minLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: SizeConfig.height * 0.02,
                right: SizeConfig.height * 0.02,
                bottom: SizeConfig.height * 0.005,
                top: SizeConfig.height * 0.005,
              ),
              hintText: AppLocalizations.of(context)!.translate("writeMessageHere").toString(),
              hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: ColorConfig().primaryColor(1),
                fontWeight: FontWeight.normal,
              ),
              border: filedWithoutBorder,
              disabledBorder: filedWithoutBorder,
              errorBorder: filedWithoutBorder,
              focusedBorder: filedWithoutBorder,
              focusedErrorBorder: filedWithoutBorder,
              enabledBorder: filedWithoutBorder,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomProfileTextField extends StatelessWidget {
  final TextEditingController controller;

  final VoidCallback onTap;
  final Function(String val) onChanged;
  final FormFieldValidator validator;
  final String hintText;
  final String topHelperText;
  final TextInputType keyboardType;
  final bool enabled;
  final bool isPassword;
  final TextInputAction textInputAction;

  final bool autofocus;
  final bool onlyNumber;
  final bool allowArabic;
  final bool? withIcon;
  final String? icon;

  final bool? withButtonIcon;
  final String? buttonIcon;

  final VoidCallback? buttonOnTap;

  final Color buttonIconColor;

  final double iconSize;

  final double buttonIconSize;

  final bool readOnly;
  final bool obscureText;

  final bool allowPaste;

  final bool isBirthDate;

  final bool? allowEmoji;

  final bool optional;

  final bool allowNumber;

  final bool denyMarkers;

  final bool allowMarkers;

  final bool isRequired;

  const CustomProfileTextField({
    super.key,
    required this.onTap,
    this.readOnly = false,
    this.isRequired=false,
    required this.controller,
    required this.onChanged,
    required this.hintText,
    required this.isPassword,
    required this.keyboardType,
    required this.enabled,
    required this.textInputAction,
    required this.validator,
    required this.autofocus,
    required this.onlyNumber,
    required this.allowArabic,
    required this.withButtonIcon,
    required this.withIcon,
    required this.icon,
    required this.buttonIcon,
    required this.buttonOnTap,
    required this.buttonIconColor,
    required this.iconSize,
    required this.buttonIconSize,
    required this.obscureText,
    required this.allowPaste,
    required this.isBirthDate,
    required this.topHelperText,
    required this.optional,
    required this.allowNumber,
    this.allowEmoji = false,
    this.denyMarkers = false,
    this.allowMarkers = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Visibility(
          visible: isRequired,
          child: Padding(
            padding:  EdgeInsets.only(right: SizeConfig.height*.01),
            child: Image(
              height: SizeConfig.height*.01,
              width: SizeConfig.height*.01,
              color: ColorConfig().primaryColor(1),
              image: const AssetImage('assets/icons/astric.png'),
            ),
          ),
        ),
        Visibility(
            visible: isRequired,
            child: SizedBox(height: SizeConfig.height*.0030,)),
        TextFormField(
          textCapitalization: TextCapitalization.sentences,
          onTap: onTap,
          readOnly: readOnly,
          cursorHeight: SizeConfig.height * 0.02,
          keyboardAppearance: Brightness.light,
          enabled: enabled,
          onChanged: onChanged,
          autofocus: autofocus,
          autocorrect: false,
          obscureText: obscureText,
          keyboardType: keyboardType,
          obscuringCharacter: "●",
          textInputAction: textInputAction,
          controller: controller,
          validator: validator,
          textAlign: TextAlign.start,
          maxLines: 1,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: ColorConfig().primaryColor(1),
            fontWeight: FontWeight.normal,
          ),
          cursorColor: ColorConfig().primaryColor(1),
          inputFormatters: allowMarkers
              ? [
            FilteringTextInputFormatter.deny(
              RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
            ),
          ]
              : [
            if (onlyNumber)
              FilteringTextInputFormatter.allow(RegExp("[٠-٩0-9]")),
            if (!allowArabic)
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z-0-9 _ + @ - .]")),
            if (isPassword || keyboardType == TextInputType.emailAddress)
              FilteringTextInputFormatter.deny(RegExp(" ")),
            if (!allowEmoji!)
              FilteringTextInputFormatter.deny(
                RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
              ),
            if (!allowNumber)
              FilteringTextInputFormatter.deny(RegExp("[٠-٩0-9]")),
            if (denyMarkers)FilteringTextInputFormatter.deny(RegExp("[-=,.;=_!@#%^&+*()-*/?]|---")),
          ],
          decoration: InputDecoration(
            enabled: enabled,
            errorMaxLines: 4,
            contentPadding: EdgeInsets.only(
              left: SizeConfig.height * 0.02,
              right: SizeConfig.height * 0.02,
              top: withButtonIcon!
                  ? SizeConfig.height * 0.035
                  : SizeConfig.height * 0.035,
              bottom: SizeConfig.height * 0.0,
            ),
            labelText:
            AppLocalizations.of(context)!.translate(topHelperText).toString(),
            hintText: AppLocalizations.of(context)!.translate(hintText).toString(),
            filled: false,
            fillColor: ColorConfig().primaryColor(0.1),
            focusColor: ColorConfig().primaryColor(1),
            hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: ColorConfig().primaryColor(0.9),
              fontWeight: FontWeight.normal,
            ),
            labelStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: ColorConfig().primaryColor(isBirthDate ? 0 : 1),
              fontWeight: FontWeight.normal,
            ),
            floatingLabelStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.w400,
            ),
            hoverColor: ColorConfig().primaryColor(1),
            border: loginFieldsBorder,
            disabledBorder: loginFieldsBorder,
            enabledBorder: loginFieldsBorder,
            errorBorder: loginFieldsBorder,
            focusedErrorBorder: loginFieldsBorder,
            focusedBorder: loginFocusedFieldsBorder,
            errorStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.normal,
              height: SizeConfig.height * 0.0015,
            ),
            helperStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.normal,
              height: 0.0,
            ),
            suffixStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.normal,
              height: 0.0,
            ),
            prefixStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ColorConfig().primaryColor(1),
              fontWeight: FontWeight.normal,
              height: 0.0,
            ),
            // left
            prefixIcon: buildFieldIcon(
              context: context,
              prefixIcon: true,
              buttonIcon: buttonIcon!,
              icon: icon!,
              withButtonIcon: withButtonIcon!,
              withIcon: withIcon!,
              buttonOnTap: buttonOnTap!,
              buttonIconColor: buttonIconColor,
              iconSize: iconSize,
              buttonIconSize: buttonIconSize,
            ),
            // button icon
            suffixIcon: buildFieldIcon(
              context: context,
              prefixIcon: false,
              buttonIcon: buttonIcon!,
              icon: icon!,
              withButtonIcon: withButtonIcon!,
              withIcon: withIcon!,
              buttonOnTap: buttonOnTap!,
              buttonIconColor: buttonIconColor,
              iconSize: iconSize,
              buttonIconSize: buttonIconSize,
            ),
          ),
        ),
      ],
    );
  }
}

Widget? buildFieldIcon({
  required BuildContext context,
  required bool withIcon,
  required bool prefixIcon,
  required bool withButtonIcon,
  required VoidCallback buttonOnTap,
  required String icon,
  required String buttonIcon,
  required Color buttonIconColor,
  required double iconSize,
  required double buttonIconSize,
}) {
  if (prefixIcon) {
    if (withIcon) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/$icon.svg",
            width: iconSize,
            height: iconSize,
            colorFilter: ColorFilter.mode(ColorConfig().greyBlackColor(1), BlendMode.srcIn),
          ),
        ],
      );
    }
    return null;
  } else if (!prefixIcon) {
    if (withButtonIcon) {
      return InkWell(
        onTap: buttonOnTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/$buttonIcon.svg",
              width: buttonIconSize,
              height: buttonIconSize,
              colorFilter: ColorFilter.mode(buttonIconColor, BlendMode.srcIn,),
            ),
          ],
        ),
      );
    }
    return null;
  }
  return null;
}

Widget? buildPhoneFieldCode({
  required BuildContext context,
  required bool prefixIcon,
  required VoidCallback buttonOnTap,
  required String countryCode,
  required String countryFlag,
  required TextStyle textStyle,
}) {
  if (prefixIcon) {
    if (AppLocalizations.of(context)!.locale.languageCode != "ar") {
      return InkWell(
        onTap: buttonOnTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: SizeConfig.height * 0.02,
            ),
            SizedBox(
              width: SizeConfig.height * 0.03,
              height: SizeConfig.height * 0.03,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: CustomImageNetwork(
                  image: countryFlag,
                  // image:image.toString(),
                  fit: BoxFit.fill,
                  loadingColor: ColorConfig().primaryColor(1),
                  errorBackground: ColorConfig().primaryColor(0.2),
                  errorImage: 'image_null_dark.png',
                  errorFit: BoxFit.contain,
                  errorImageSize: SizeConfig.height * 0.016,
                  errorPadding:
                  EdgeInsets.only(bottom: SizeConfig.width * 0.0000001),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.height * 0.01,
            ),
            Text(
              countryCode,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: textStyle.copyWith(
                color: ColorConfig().primaryColor(1),
              ),
            ),
            SizedBox(
              width: SizeConfig.height * 0.015,
            ),
          ],
        ),
      );
    }
    return null;
  } else if (!prefixIcon) {
    if (AppLocalizations.of(context)!.locale.languageCode == "ar") {
      return InkWell(
        onTap: buttonOnTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              countryCode,
              textDirection: TextDirection.ltr,
              style: textStyle.copyWith(
                color: ColorConfig().primaryColor(1),
              ),
            ),
            SizedBox(
              width: SizeConfig.height * 0.01,
            ),
            SizedBox(
              width: SizeConfig.height * 0.03,
              height: SizeConfig.height * 0.03,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: CustomImageNetwork(
                  image: countryFlag,
                  // image:image.toString(),
                  fit: BoxFit.fill,
                  loadingColor: ColorConfig().primaryColor(1),
                  errorBackground: ColorConfig().primaryColor(0.2),
                  errorImage: 'image_null_dark.png',
                  errorFit: BoxFit.contain,
                  errorImageSize: SizeConfig.height * 0.016,
                  errorPadding:
                  EdgeInsets.only(bottom: SizeConfig.width * 0.0000001),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.height * 0.02,
            ),
          ],
        ),
      );
    }
    return null;
  }
  return null;
}
