import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback tryAgainOnTap;
  final bool withTryAgainButton;
  final bool isConnectionError;
  final bool isApiError;

  const CustomErrorWidget({super.key,required this.isConnectionError,required this.isApiError,required this.tryAgainOnTap,this.withTryAgainButton=true,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        0.03.heightBox,
        //connection error
        VisibleWidget(
            visible: isConnectionError,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/network-error-2.svg",
                  colorFilter: ColorFilter.mode(ColorConfig().greyColor(1), BlendMode.srcIn),
                  fit: BoxFit.cover,
                  width: SizeConfig.height * .16,
                  height: SizeConfig.height * .14,
                ),

                // Lottie.asset(
                //   'assets/gif/error_wifi.json',
                // ),
              ],
            )
        ),

        // api error
        VisibleWidget(
          visible: isApiError&&!isConnectionError,
          child: SvgPicture.asset(
            "assets/images/errors/404 Error.svg",
            fit: BoxFit.cover,
            width: SizeConfig.height * .396,
            height :SizeConfig.height * .412,
          ),
        ),

        .021.heightBox,

        //title
        Text(
          isConnectionError?"there_is_no_internet".tr:"apiErrorMessage".tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorConfig().primaryColor(1), fontSize: 16),
        ),

        .015.heightBox,

        Text(
          isConnectionError?"lostConnectionBody".tr:"apiErrorBody".tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:  ColorConfig().greyBlackColor(1), fontSize: 14),
        ),

        .08.heightBox,

        //try again
        Visibility(
          visible: withTryAgainButton,
          child: SizedBox(
            width: SizeConfig.height * 0.278,
            height: SizeConfig.height * 0.050,
            child: ElevatedButton(
              onPressed: tryAgainOnTap,
              style: ButtonStyle(backgroundColor:MaterialStateProperty.all( ColorConfig().primaryColor(1),),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular( SizeConfig.height*0.0107,),),),),
              child: Text(isConnectionError?'reconnect'.tr:'tryAgainButton'.tr,style: Theme.of(context).textTheme.titleMedium?.copyWith(color:  ColorConfig().whiteColor(1),),),
            ),
          ),
        ),
      ],
    );
    //   CustomScrollView(
    //   keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    //   physics:  const ClampingScrollPhysics(),
    //   slivers: [
    //     const SliverAppBarLogoAndBack(
    //       withBackButton: true,
    //     ),
    //
    //     SliverToBoxAdapter(
    //       child:Column(
    //         children: [
    //
    //           0.03.heightBox,
    //
    //           //connection error
    //           VisibleWidget(
    //             visible: isConnectionError,
    //             child: Stack(
    //               alignment: Alignment.center,
    //               children: [
    //                 SvgPicture.asset(
    //                   "assets/images/error_connection.svg",
    //                   fit: BoxFit.cover,
    //                   width: SizeConfig.height * .36,
    //                   height: SizeConfig.height * .44,
    //                 ),
    //
    //                 Lottie.asset(
    //                   'assets/gif/error_wifi.json',
    //                 ),
    //               ],
    //             )
    //           ),
    //
    //           // api error
    //           VisibleWidget(
    //             visible: isApiError&&!isConnectionError,
    //             child: SvgPicture.asset(
    //               "assets/images/error.svg",
    //               fit: BoxFit.cover,
    //               width: SizeConfig.height * .396,
    //               height :SizeConfig.height * .412,
    //             ),
    //           ),
    //
    //           .021.heightBox,
    //
    //           //title
    //           Text(
    //             isConnectionError?"lostConnectionTitle".tr:"apiErrorMessage".tr,
    //             textAlign: TextAlign.center,
    //             style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: ColorConfig().secondaryColor(1),),
    //           ),
    //
    //           .015.heightBox,
    //
    //           Text(
    //             isConnectionError?"lostConnectionBody".tr:"apiErrorBody".tr,
    //             textAlign: TextAlign.center,
    //             style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorConfig().greyBlackColor(1),),
    //           ),
    //
    //           .015.heightBox,
    //
    //           //try again
    //           Visibility(
    //             visible: withTryAgainButton,
    //             child: SizedBox(
    //               width: SizeConfig.height * 0.278,
    //               height: SizeConfig.height*0.050,
    //               child: ElevatedButton(
    //                 onPressed: tryAgainOnTap,
    //                 style: ButtonStyle(backgroundColor:MaterialStateProperty.all(ColorConfig().primaryColor(1),),
    //                   shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular( SizeConfig.height*0.0107,),),),),
    //                 child: Text(isConnectionError?'reconnect'.tr:'tryAgainButton'.tr,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorConfig().whiteColor(1),),),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}