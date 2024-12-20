import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:flutter/material.dart';

// pop decoration

// pop decoration
BoxDecoration notificationCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(SizeConfig.height * 0.04),
  border: Border.all(width: 1),
  gradient: LinearGradient(
    colors: [
      ColorConfig().primaryColor(1),
      ColorConfig().primaryColor(1),
      ColorConfig().primaryColor(1),
      ColorConfig().primaryColor(1),
    ],
  ),
);

BoxDecoration homeProfileAvatarDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(SizeConfig.height * 0.02),
  border: Border.all(
    width: 2,
  ),
  gradient: LinearGradient(
    colors: [
      ColorConfig().primaryColor(1),
      ColorConfig().primaryColor(1),
      ColorConfig().primaryColor(1),
      ColorConfig().primaryColor(1),
    ],
  ),
);

/// login fields

final OutlineInputBorder loginFieldsBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(SizeConfig.height * 0.0107),
  borderSide: BorderSide(
    color: ColorConfig().greyBlackColor(0.3),
    width: 0.5,
  ),
);

final OutlineInputBorder loginFocusedFieldsBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(SizeConfig.height * 0.0107),
  borderSide: BorderSide(
    color: ColorConfig().primaryColor(0.3),
    width: 1,
  ),
);
final OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(SizeConfig.height * 0.0107),
  borderSide: BorderSide(
    color: ColorConfig().redColor(1),
    width: 1,
  ),
);

const UnderlineInputBorder filedWithoutBorder = UnderlineInputBorder(
  borderSide: BorderSide.none,
);

final OutlineInputBorder searchInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(100),
  borderSide: BorderSide(
    color: ColorConfig().primaryColor(1),
    width: 0.0,
  ),
);

/// edit profile

final OutlineInputBorder editProfileDisabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(SizeConfig.height * 0.02),
  borderSide: BorderSide(
    color: ColorConfig().primaryColor(1),
    width: 0.8,
  ),
);

final OutlineInputBorder editProfileActiveBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(SizeConfig.height * 0.02),
  borderSide: BorderSide(
    color: ColorConfig().primaryColor(1),
    width: 1,
  ),
);

final OutlineInputBorder editProfileFocusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(SizeConfig.height * 0.02),
  borderSide: BorderSide(
    color: ColorConfig().primaryColor(1),
    width: 1,
  ),
);

/// otp decoration

// final defaultPinTheme = PinTheme(
//   height: SizeConfig.height * 0.054,
//   width: SizeConfig.height * 0.05,
//   decoration: BoxDecoration(
//     color: ColorConfig().greyLightColor(1),
//     borderRadius: BorderRadius.circular(SizeConfig.height * 0.017),
//     border: Border.all(
//       color: ColorConfig().greyLightColor(1),
//       width: 0.7,
//     ),
//   ),
// );
//
// final focusedPinTheme = PinTheme(
//   height: SizeConfig.height * 0.054,
//   width: SizeConfig.height * 0.05,
//   decoration: BoxDecoration(
//     color: ColorConfig().greyLightColor(1),
//     borderRadius: BorderRadius.circular(SizeConfig.height * 0.017),
//     border: Border.all(
//       color: ColorConfig().primaryColor(1),
//       width: 0.7,
//     ),
//   ),
// );
//
// final submittedPinTheme = PinTheme(
//   height: SizeConfig.height * 0.065,
//   width: SizeConfig.height * 0.06,
//   decoration: BoxDecoration(
//     color: ColorConfig().greyLightColor(1),
//     borderRadius: BorderRadius.circular(SizeConfig.height * 0.017),
//     border: Border.all(
//       color: ColorConfig().greyLightColor(1),
//       width: 0.7,
//     ),
//   ),
// );

final OutlineInputBorder filterOutlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(100),
  borderSide: BorderSide(
    color: ColorConfig().primaryColor(1),
    width: 0.0,
  ),
);

final OutlineInputBorder loginOutlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(100),
  borderSide: BorderSide(
    color: ColorConfig().primaryColor(1),
    width: 0.4,
  ),
);

final OutlineInputBorder loginActiveOutlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(100),
  borderSide: BorderSide(
    color: ColorConfig().primaryColor(1),
    width: 0.4,
  ),
);

final OutlineInputBorder loginErrorOutlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(100),
  borderSide: const BorderSide(
    color: Colors.red,
    width: 0.4,
  ),
);

final OutlineInputBorder commentFieldBoxDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(SizeConfig.height * 0.02),
  borderSide: BorderSide(
    width: 1,
    color: ColorConfig().primaryColor(1),
  ),
);

final OutlineInputBorder commentFocusedFieldBoxDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(SizeConfig.height * 0.02),
  borderSide: BorderSide(
    color: ColorConfig().primaryColor(1),
    width: 1,
  ),
);

final UnderlineInputBorder filedBorderOnlyBottom = UnderlineInputBorder(
  borderSide: BorderSide(color: ColorConfig().primaryColor(1)),
);

const OutlineInputBorder circleRadiusBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(100)),
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
);

BoxDecoration singleProductCommentAndPriceCard = BoxDecoration(
  color: ColorConfig().primaryColor(1),
  borderRadius: BorderRadius.circular(15),
  boxShadow: [
    BoxShadow(
      color: ColorConfig().primaryColor(1),
      spreadRadius: 1,
      blurRadius: 5,
      offset: const Offset(0, 1), // changes position of shadow
    ),
  ],
);

BoxDecoration jobDetailsExpandableDecoration = BoxDecoration(
  color: ColorConfig().primaryColor(1),
  border: Border(
    bottom: BorderSide(
      color: ColorConfig().primaryColor(1),
      width: SizeConfig.height * 0.0003,
    ),
  ),
);

///aswaaq login background
BoxDecoration aswaqLoginBackground = BoxDecoration(
    color: ColorConfig().whiteColor(.1),
    image: const DecorationImage(
      image: AssetImage('assets/images/logo-no-background.png'),
      fit: BoxFit.cover
    ),
);
