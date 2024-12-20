import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/widgets/custom_expandable.dart';
import 'package:flutter/material.dart';

class CardsDecorationThemeConfig {
  static Color statusBarColorLight = Colors.white.withOpacity(0);
  static Color statusBarColorDark = Colors.black.withOpacity(0);

  // main cards decoration
  static BoxDecoration mainCardsDecoration() {
    return BoxDecoration(
      color: ColorConfig().whiteColor(1),
      borderRadius: BorderRadius.circular(SizeConfig.height * 0.01),
      boxShadow: [
        BoxShadow(
          color: ColorConfig().greyColor(0.2),
          spreadRadius: 0.5,
          blurRadius: 4,
          offset: const Offset(1, 2), // changes position of shadow
        ),
      ],
    );
  }

  // main cards decoration
  static BoxDecoration userAvatarDecoration(double borderWidth) {
    return BoxDecoration(
      color: ColorConfig().whiteColor(1),
      borderRadius: BorderRadius.circular(SizeConfig.height * 0.1),
      border: Border.all(
        color: ColorConfig().redColor(0.5),
        width: borderWidth,
      ),
      boxShadow: [
        BoxShadow(
          color: ColorConfig().greyColor(0.05),
          spreadRadius: 0.5,
          blurRadius: 1,
          offset: const Offset(1, 2), // changes position of shadow
        ),
      ],
    );
  }

  // search bar card decoration
  static BoxDecoration searchBarCardDecoration() {
    return BoxDecoration(
      color: ColorConfig().whiteColor(1),
      borderRadius: BorderRadius.circular(
        SizeConfig.height * 0.015,
      ),
      boxShadow: [
        BoxShadow(
          color: ColorConfig().greyColor(0.05),
          offset: const Offset(0.3, 3),
          blurRadius: 2,
        ),
      ],
    );
  }

  // main cards decoration
  static BoxDecoration homeCategoryCardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(SizeConfig.height * 0.01),
      gradient:  const LinearGradient(
        begin: Alignment.center,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Colors.transparent,
          Colors.black87,
        ],
      )
    );
  }


  static ExpandableThemeData expandableFilterThemeData() {
    return ExpandableThemeData(
      tapBodyToCollapse: false,
      hasIcon: true,
      useInkWell: true,
      tapHeaderToExpand: true,
      alignment: Alignment.topCenter,
      tapBodyToExpand: true,
      iconPadding: EdgeInsets.only(
        top: SizeConfig.height*0.008,
        left: SizeConfig.height*0.005,
        right: SizeConfig.height*0.005,
      ),
      iconColor: ColorConfig().blackColor(1),
    );
  }

  static BoxDecoration collapseFilterHeaderCardDecoration({required bool selected}){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(SizeConfig.height*.01),
      color: selected?null:ColorConfig().whiteColor(1),
    );
  }

  static BoxDecoration cartProductDecoration(){
    return BoxDecoration(
      color: ColorConfig().whiteColor(1),
      borderRadius: BorderRadius.circular(SizeConfig.height * 0.012),
      border: Border.all(color: ColorConfig().greyColor(.4),
      ),
    );
  }

  static BoxDecoration cartPromoCodeDecoration(){
    return BoxDecoration(
      color: ColorConfig().whiteColor(1),
      borderRadius: BorderRadius.circular(SizeConfig.height * 0.012),
      border: Border.all(color: ColorConfig().greyColor(0.2)),
      boxShadow: [
        BoxShadow(
          color: ColorConfig().blackColor(0.1),
          blurRadius: SizeConfig.height * 0.010,
          offset: Offset(0, SizeConfig.height * 0.006),
        ),
      ],
    );
  }

  static BoxDecoration cartPaymentDetailsDecoration(){
    return BoxDecoration(
      color: ColorConfig().whiteColor(1),
      borderRadius: BorderRadius.circular(SizeConfig.height * 0.012),
      border: Border.all(color: ColorConfig().greyColor(0.2)),
      boxShadow: [
        BoxShadow(
          color: ColorConfig().blackColor(0.1),
          blurRadius: SizeConfig.height * 0.010,
          offset: Offset(0, SizeConfig.height * 0.006),
        ),
      ],
    );
  }


}
