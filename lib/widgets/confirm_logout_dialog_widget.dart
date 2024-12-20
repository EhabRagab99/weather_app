import 'package:iem_app/helpers/app_localizations.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PopupWidget extends StatelessWidget {
  final  String image;
  final bool withButton2;
  final String title;
  final String button1Name;
  final String button2Name;
  final String subtitle;
  final VoidCallback onClickButton1;

  const PopupWidget({
    Key? key,
    required this.image,
    required this.withButton2,
    required this.button1Name,
    required this.button2Name,
    required this.subtitle,
    required this.onClickButton1,
    required this.title
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.height * 0.26,
        bottom: SizeConfig.height * 0.15,
      ),
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.050),
        child: Align(
          alignment: Alignment.topCenter,
          child: Material(
            borderRadius: BorderRadius.circular(SizeConfig.height * 0.04),
            color: ColorConfig().whiteColor(1),
            child: Directionality(
              textDirection: AppLocalizations.of(context)!.locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  0.032.heightBox,

                  // title
                  VisibleWidget(
                    visible: image.isNotEmpty,
                    child: Center(
                      child: SvgPicture.asset(
                        image,
                      ),
                    ),
                  ),

                  0.01.heightBox,


                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.038),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorConfig().secondaryColor(1),
                      ),
                    ),
                  ),

                  0.01.heightBox,

                  VisibleWidget(
                    visible: subtitle.isNotEmpty,
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.038),
                      child: Text(
                        subtitle ,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: ColorConfig().greyBlackColor(1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),


                  // TODO: implement initState

                  VisibleWidget(
                    visible: subtitle.isNotEmpty,
                    child: 0.014.heightBox,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsetsDirectional.only(start:!withButton2? SizeConfig.height*.045:0),
                        child: SizedBox(
                          width: SizeConfig.height*.13,
                          child: CustomButton(
                            buttonTitle:button1Name,
                            onPressed: onClickButton1,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ColorConfig().whiteColor(1),
                              fontWeight: FontWeight.w400,
                            ),
                            borderRadius: BorderRadius.circular(SizeConfig.height * 0.0075),
                          ),
                        ),
                      ),

                      0.04.widthBox,

                      VisibleWidget(
                        visible: withButton2,
                        child: SizedBox(
                          width: SizeConfig.height*.13 ,
                          child: CustomButton(
                            buttonTitle:button2Name,
                            onPressed: ()=>Navigator.pop(context),
                            borderColor: ColorConfig().greyLightColor(1),
                            color: ColorConfig().whiteColor(1),
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ColorConfig().secondaryColor(1),
                              fontWeight: FontWeight.w400,
                            ),
                            borderRadius: BorderRadius.circular(SizeConfig.height * 0.0075),
                          ),
                        ),
                      ),
                    ],
                  ),

                  0.03.heightBox

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
