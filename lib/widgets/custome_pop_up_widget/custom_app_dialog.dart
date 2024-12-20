import 'package:iem_app/helpers/app_localizations.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowDialog{

  showAppDialog({
    required BuildContext context,
    required String image,
    required String title,
    required String subTitle,
    required String doneButtonTitle,
    String? cancelButtonTitle,
    required VoidCallback doneClick,
    VoidCallback? cancelClick,
    bool withCancel=false,

  })async{
     await showDialog(
         context: context,
         barrierColor: ColorConfig().greyColor(0.5),
         barrierDismissible: true,
         builder: (BuildContext context) {
           return WillPopScope(
             onWillPop: () async {
               return true;
             },
             child: Padding(
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
                           // image
                           Center(child: SvgPicture.asset(image,),),

                           0.021.heightBox,

                           //  title
                           Padding(
                             padding:EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.038),
                             child: Text(
                               title,
                               textAlign: TextAlign.center,
                               style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                 color: ColorConfig().blackColor(1),
                               ),
                             ),
                           ),
                           0.01.heightBox,
                           //  title
                           Padding(
                             padding:EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.038),
                             child: Text(
                               subTitle,
                               textAlign: TextAlign.center,
                               style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                 color: ColorConfig().greyColor(1),
                               ),
                             ),
                           ),

                           0.018.heightBox,
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [

                               SizedBox(
                                 height: SizeConfig.height * 0.033,
                                 width: SizeConfig.height * 0.09,
                                 child: CustomButton(
                                   buttonTitle:doneButtonTitle,
                                   onPressed: doneClick,
                                   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                     color: ColorConfig().whiteColor(1),
                                   ),
                                   borderRadius: BorderRadius.circular(SizeConfig.height * 0.0075),
                                 ),
                               ),

                               VisibleWidget(
                                    visible: withCancel,
                                   child: 0.04.widthBox,
                               ),

                               VisibleWidget(
                                 visible: withCancel,
                                 child: TextButton(
                                   onPressed:cancelClick?? () => Navigator.pop(context),
                                   child: Text(
                                     cancelButtonTitle!=null?cancelButtonTitle.tr:'cancel'.tr,
                                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                       color: ColorConfig().blackColor(1),
                                       fontWeight: FontWeight.w400,
                                     ),
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
             ),
           );

         },
    );
  }
}