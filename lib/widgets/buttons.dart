import 'package:iem_app/helpers/app_localizations.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final String buttonTitle;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? style;
  final bool? hasIcon, enabled;
  final Widget? icon;
  final FontWeight? fontWeight;
  final int? titleMaxLines;

  const CustomButton({
    super.key,
    this.height,
    this.color,
    this.width,
    required this.buttonTitle,
    required this.onPressed,
    this.borderColor,
    this.textColor,
    this.borderRadius,
    this.style,
    this.hasIcon = false,
    this.icon,
    this.enabled = true,
    this.padding,
    this.fontWeight,
    this.titleMaxLines,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? SizeConfig.height * .05,
        width: width,
        decoration: BoxDecoration(
          color: enabled == false ? ColorConfig().greyColor(1) : color ?? ColorConfig().primaryColor(1),
          borderRadius: borderRadius ?? BorderRadius.circular(SizeConfig.height * .012),
          border: Border.all(
            color: enabled == false ? ColorConfig().greyColor(1) : borderColor ?? ColorConfig().primaryColor(1),),),
        padding: padding??EdgeInsets.zero,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding:EdgeInsets.symmetric(horizontal: SizeConfig.height*.01),
                    child: Text(
                      buttonTitle,
                      style: style ??
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: enabled == false
                                ? ColorConfig().greyBlackColor(1)
                                : textColor ?? ColorConfig().whiteColor(1),
                            fontWeight: fontWeight ?? null,
                          ),
                      maxLines: titleMaxLines ?? 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              VisibleWidget(visible: hasIcon, child: 0.01.widthBox),
              VisibleWidget(visible: hasIcon, child: icon ?? const SizedBox(),),

            ],
          ),
        ),
      ),
    );
  }
}

class CustomMainButton extends StatelessWidget {
  final bool enabled;
  final double elevation;
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;
  final String buttonText;
  final VoidCallback onPress;
  final Color onPressColor;
  final TextStyle style;
  final double borderWidth;
  final double? height;
  final double radius;

  const CustomMainButton({
    super.key,
    required this.enabled,
    required this.elevation,
    required this.backgroundColor,
    required this.borderColor,
    required this.onPressColor,
    required this.onPress,
    required this.shadowColor,
    required this.style,
    required this.borderWidth,
    required this.buttonText,
    this.height,
    this.radius = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? SizeConfig.height * 0.06,
      child: ElevatedButton(
        onPressed: enabled ? onPress : null,
        style: ElevatedButton.styleFrom(
          foregroundColor:
              enabled ? onPressColor : backgroundColor.withOpacity(0.5),
          padding: const EdgeInsets.all(0),
          backgroundColor:
              enabled ? backgroundColor : backgroundColor.withOpacity(0.5),
          elevation: elevation,
          shadowColor: shadowColor,
          disabledBackgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(
                radius == 1.5 ? SizeConfig.height * 0.04 : radius),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            // AppLocalizationsns.of(context)!.translate(buttonText).toString(),
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
      ),
    );
  }
}

class CustomMainButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color borderColor;
  final Widget iconWidget;
  final Color shadowColor;
  final void Function() onPress;
  final Color onPressColor;
  final bool enabled;
  final TextStyle style;
  final double borderWidth;
  final double elevation;
  final double? height;
  final double? width;
  final String? translateText;
  final bool withText;
  final double? borderRadius;
  final bool isCentre;

  const CustomMainButtonWithIcon({
    super.key,
    required this.buttonText,
    required this.onPressColor,
    required this.iconWidget,
    required this.backgroundColor,
    required this.onPress,
    required this.shadowColor,
    required this.enabled,
    required this.borderColor,
    required this.style,
    this.borderRadius,
    this.withText = true,
    this.isCentre = false,
    required this.borderWidth,
    required this.elevation,
    this.translateText,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? SizeConfig.height * 0.05,
      width: width ?? SizeConfig.width * 0.05,
      child: ElevatedButton(
        onPressed: enabled ? onPress : () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: onPressColor,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 1000),
            side: BorderSide(
              width: borderWidth,
              color: borderColor,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.0),
          child: Row(
            mainAxisAlignment: isCentre
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: withText,
                child: Text(
                  translateText ?? AppLocalizations.of(context)!.translate(buttonText).toString(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: style,
                ),
              ),
              Visibility(
                visible: withText,
                child: SizedBox(
                  width: SizeConfig.height * 0.01,
                ),
              ),
              iconWidget,
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButtonCircleIcon extends StatelessWidget {
  final void Function() onPress;
  final Color onPressColor;
  final Color backgroundColor;
  final Color shadowColor;
  final Color iconColor;
  final bool enabled;
  final double elevation;
  final Color borderColor;
  final double borderWidth;
  final double iconSize;
  final bool iconIsWidget;
  final IconData iconData;
  final String iconName;
  final double radius;

  const CustomButtonCircleIcon({
    super.key,
    required this.onPressColor,
    required this.backgroundColor,
    required this.onPress,
    required this.shadowColor,
    required this.iconName,
    required this.enabled,
    required this.iconColor,
    required this.borderWidth,
    required this.borderColor,
    required this.elevation,
    required this.iconIsWidget,
    required this.iconData,
    required this.iconSize,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPress : () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        elevation: 0.1,
        shadowColor: shadowColor,
        foregroundColor: onPressColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: borderWidth,
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Center(
        child: Visibility(
          visible: iconIsWidget,
          replacement: SvgPicture.asset(
            "assets/icons/$iconName.svg",
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            width: iconSize,
            height: iconSize,
          ),
          child: Icon(
            iconData,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}

class CustomLoginBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomLoginBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Icon(
        Icons.navigate_before,
        size: SizeConfig.height * 0.045,
        color: ColorConfig().blackColor(1),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final double size;
  final String icon;
  final void Function() onTap;
  const CustomIconButton(
      {super.key, required this.size, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        'assets/icons/$icon.svg',
        height: size,
        width: size,
      ),
    );
  }
}

class CustomChatSendButton extends StatelessWidget {
  final double size;
  final bool activeButton;
  final bool disableSendButton;
  final void Function() onTap;
  const CustomChatSendButton({
    super.key,
    required this.size,
    required this.activeButton,
    required this.onTap,
    required this.disableSendButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: disableSendButton ? (ColorConfig().primaryColor(0.1)) : (activeButton ? ColorConfig().primaryColor(1) : ColorConfig().primaryColor(1)),
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.height * 0.01),
          child: Icon(
            activeButton ? Icons.send_rounded : Icons.send_outlined,
            size: size,
            color: activeButton ? ColorConfig().whiteColor(1) : ColorConfig().whiteColor(1),
          ),
        ),
      ),
    );
  }
}


class CustomRadioButtonWidget extends StatelessWidget {
  final bool selected;
  final bool inStock;
   const CustomRadioButtonWidget({super.key,required this.selected,this.inStock=true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height * 0.020,
      width: SizeConfig.height * 0.020,
      padding: EdgeInsets.all(SizeConfig.height * 0.003),
      margin: EdgeInsets.all(SizeConfig.height * 0.005),
      decoration: BoxDecoration(
        color: ColorConfig().whiteColor(0.2),
        border: Border.all(color:inStock? ColorConfig().primaryColor(.4):ColorConfig().greyColor(1)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: selected&&inStock ? ColorConfig().primaryColor(1):Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

buildButtonIcon(BuildContext context, String icon) {
  return Container(
    decoration: BoxDecoration(
      color: ColorConfig().primaryColor(1).withOpacity(0.2),
      shape: BoxShape.circle,
    ),
    child: Container(
      margin: EdgeInsets.all(SizeConfig.height * 0.00925),
      child: SvgPicture.asset(
        "assets/icons/$icon.svg",
        width: SizeConfig.height * 0.02543,
        height: SizeConfig.height * 0.02543,
      ),
    ),
  );
}

Widget dots({
  required int current,
  index,
  required Color activeColor,
  required void Function() dotOnTap,
}) {
  if (current != index) {
    return GestureDetector(
      onTap: dotOnTap,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          color: dotColor(current, index, activeColor),
        ),
      ),
    );
  } else {
    return GestureDetector(
      onTap: dotOnTap,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          color: dotColor(current, index, activeColor),
        ),
      ),
    );
  }
}

Color dotColor(int current, int index, Color activeColor) {
  return current == index ? activeColor : ColorConfig().whiteColor(1);
}

class CustomDownloadItemButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color borderColor;
  final Widget iconWidget;
  final Color shadowColor;
  final void Function() onPress;
  final Color onPressColor;
  final bool enabled;
  final TextStyle style;
  final double borderWidth;
  final double elevation;
  final String? translateText;
  final bool withText;

  const CustomDownloadItemButtonWithIcon({
    super.key,
    required this.buttonText,
    required this.onPressColor,
    required this.iconWidget,
    required this.backgroundColor,
    required this.onPress,
    required this.shadowColor,
    required this.enabled,
    required this.borderColor,
    required this.style,
    this.withText = true,
    required this.borderWidth,
    required this.elevation,
    this.translateText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPress : () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: onPressColor,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.all(0),
        elevation: elevation,
        shadowColor: shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
          side: BorderSide(
            width: borderWidth,
            color: borderColor,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.02),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translateText ??
                    AppLocalizations.of(context)!
                        .translate(buttonText)
                        .toString(),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: style,
              ),
              SizedBox(
                width: SizeConfig.height * 0.01,
              ),
              iconWidget,
            ],
          ),
        ),
      ),
    );
  }
}
