import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:iem_app/widgets/custom_fields_widget.dart';
import 'package:iem_app/widgets/default_text_widget.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarLoginBack extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback backOnTap;
  final Widget? title;
  final EdgeInsetsGeometry? padding;
  final double? leadingWidth;
  const AppBarLoginBack({
    super.key,
    required this.backOnTap,
    this.title, this.padding, this.leadingWidth,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth ?? SizeConfig.height * 0.095,
      centerTitle: true,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      title: title,
      leading: CustomLoginBackButton(onPressed: backOnTap,),
      actions: [
        Padding(
          padding: padding ?? EdgeInsets.only(
            top: SizeConfig.height * 0.02,
            left: SizeConfig.height * 0.03,
            right: SizeConfig.height * 0.03,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // logo

              // language button
              // OnBoardingLanguageButton(
              //   onPressed: languageOnTab
              // ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
class AppBarWithoutBack extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final EdgeInsetsGeometry? padding;
  final double? leadingWidth;
  const AppBarWithoutBack({
    super.key,
    this.title, this.padding, this.leadingWidth,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth ?? SizeConfig.height * 0.095,
      centerTitle: true,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      title: title,
      // leading: CustomLoginBackButton(onPressed: backOnTap,),
      actions: [
        Padding(
          padding: padding ?? EdgeInsets.only(
            top: SizeConfig.height * 0.02,
            left: SizeConfig.height * 0.03,
            right: SizeConfig.height * 0.03,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // logo

              // language button
              // OnBoardingLanguageButton(
              //   onPressed: languageOnTab
              // ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class AppBarWithBackButton extends StatelessWidget implements PreferredSizeWidget{


  const AppBarWithBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   return  AppBar(
     backgroundColor: ColorConfig().whiteColor(1),
     centerTitle: true,
     elevation: 0,
     title:Image.asset(
       "assets/images/logo-no-background.png",
       width: SizeConfig.height * 0.1,
       height: SizeConfig.height * 0.1,
       color: ColorConfig().blackColor(1),

     ) ,
     leading: IconButton(
       icon: Icon(Icons.arrow_back_ios,color: ColorConfig().blackColor(1),size: SizeConfig.height*.025),
       onPressed: ()=>Navigator.pop(context),
     ),
   );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

}

class AppBarLogoAndSearchAndBack extends StatelessWidget implements PreferredSizeWidget{
  final VoidCallback? backOnTap;
  final bool withBackButton;
  final VoidCallback? fieldOnTap;
  final Function(String val)? fieldOnChange;
  final bool fieldEnable;
  final bool showClearButton;
  final bool autofocus;
  final VoidCallback? clearOnTap;
  final EdgeInsets? padding;
  final TextEditingController? controller;
  final bool withFilterButton;
  final VoidCallback? filterOnTap;

  const AppBarLogoAndSearchAndBack({
    super.key,
    this.autofocus=false,
    this.withBackButton=false,
    this.backOnTap,
    this.fieldEnable=false,
    this.fieldOnTap,
    this.fieldOnChange,
    this.showClearButton=false,
    this.controller,
    this.clearOnTap,
    this.padding,
    this.withFilterButton=false,
    this.filterOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: ColorConfig().whiteColor(1),
      centerTitle: true,
      elevation: 0,
      title:Image.asset(
        "assets/images/logo-no-background.png",
        width: SizeConfig.height * 0.1,
        height: SizeConfig.height * 0.1,
        color: ColorConfig().blackColor(1),

      ) ,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios,color: ColorConfig().blackColor(1),size: SizeConfig.height*.025),
        onPressed: ()=>Navigator.pop(context),
      ),
      // bottom: PreferredSize(
      //   preferredSize: Size(SizeConfig.width, SizeConfig.height*0.07),
      //   child:Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       // search bar
      //       Expanded(
      //         child: Column(
      //           children: [
      //             GestureDetector(
      //               onTap:fieldEnable?(){}:fieldOnTap??()=>StateMainSearchOnTap(context).onTap(context: context,),
      //               child: Padding(
      //                 padding:padding??EdgeInsets.only(
      //                   right: withFilterButton?SizeConfig.height * 0.01:SizeConfig.height * 0.02,
      //                   left: SizeConfig.height * 0.02,
      //                 ),
      //                 child: CustomGenericSearchField(
      //                   controller: controller??helperSearchGeneric.searchController ,
      //                   textInputAction: TextInputAction.done,
      //                   allowNumber: true,
      //                   autofocus: autofocus,
      //                   enabled: fieldEnable,
      //                   allowArabic: true,
      //                   withIcon: true,
      //                   textCapitalization: TextCapitalization.sentences,
      //                   withButtonIcon: showClearButton&&context.read<HelperSearchGeneric>().showClearIconButton,
      //                   iconSize: SizeConfig.height * 0.0214,
      //                   buttonIconSize: SizeConfig.height * 0.017,
      //                   buttonIconColor: ColorConfig().primaryColor(0.6),
      //                   icon: "search_icon",
      //                   buttonIcon: "circle-xmark",
      //                   hintText: "search".tr,
      //                   onTap:fieldEnable?fieldOnTap??()=>StateMainSearchOnTap(context).onTap(context: context,):(){},
      //                   onChanged:fieldOnChange?? (val)=>{},
      //                   buttonOnTap: showClearButton?clearOnTap:(){},
      //                   validator: (val) {
      //                     return null;
      //                   },
      //
      //                 ),
      //               ),
      //             ),
      //
      //             0.01.heightBox,
      //           ],
      //         ),
      //       ),
      //
      //       // filter
      //       VisibleWidget(
      //         visible: withFilterButton,
      //         child: CustomMainButtonWithIcon(
      //           onPress: filterOnTap??(){},
      //           height: SizeConfig.height*0.052,
      //           width: SizeConfig.height*0.055,
      //           withText: false,
      //           backgroundColor: ColorConfig().whiteColor(1),
      //           buttonText: "",
      //           elevation:0 ,
      //           enabled:true ,
      //           style: const TextStyle(),
      //           borderRadius: SizeConfig.height*0.01,
      //           shadowColor: ColorConfig().whiteColor(1),
      //           onPressColor:ColorConfig().whiteColor(1) ,
      //           borderColor: ColorConfig().greyLightColor(1),
      //           borderWidth: 1,
      //           iconWidget: Center(
      //             child: SvgPicture.asset(
      //               "assets/icons/Icon-filter.svg",
      //               width: SizeConfig.height*0.02,
      //               colorFilter: ColorFilter.mode(ColorConfig().greyBlackColor(1), BlendMode.srcIn,),
      //             ),
      //           ),
      //           isCentre: true,
      //         ),
      //       ),
      //
      //       VisibleWidget(
      //         visible: withFilterButton,
      //         child: 0.02.widthBox,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

}


class SliverAppBarLogoAndBack extends StatelessWidget {
  final VoidCallback? backOnTap;
  final bool withBackButton;

  const SliverAppBarLogoAndBack({
    super.key,
    this.withBackButton=false,
    this.backOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
        builder: (BuildContext context, constraints) {
          return SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            // backgroundColor: constraints.scrollOffset > 0?Colors.grey.shade900.withOpacity(0.8):Colors.transparent,
            floating: false,
            stretch: false,
            pinned: true,
            snap: false,
            primary: true,
            elevation: 20,
            scrolledUnderElevation: 0,
            backgroundColor: ColorConfig().scaffoldBackgroundColor(1),
            surfaceTintColor: ColorConfig().scaffoldBackgroundColor(1),
            shadowColor: ColorConfig().scaffoldBackgroundColor(1),
            foregroundColor: ColorConfig().scaffoldBackgroundColor(1),
            expandedHeight:SizeConfig.height*0.05,
            titleSpacing: 0,
            centerTitle: true,
            leadingWidth: withBackButton?null:0,
            leading: VisibleWidget(
              visible: withBackButton,
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.arrow_back_ios_sharp, color: ColorConfig().blackColor(1),),
                    onPressed:backOnTap?? () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            title:Image.asset(
              "assets/images/logo-no-background.png",
              width: SizeConfig.height * 0.1,
              color: ColorConfig().blackColor(1),
            ),
          );
        }
    );
  }
}

class SliverAppBarLogoAndSearchAndBack extends StatelessWidget {
  final VoidCallback? backOnTap;
  final bool withBackButton;
  final VoidCallback? fieldOnTap;
  final Function(String val)? fieldOnChange;
  final bool fieldEnable;
  final bool showClearButton;
  final bool autofocus;
  final VoidCallback? clearOnTap;
  final EdgeInsets? padding;
  final TextEditingController? controller;
  final bool withFilterButton;
  final VoidCallback? filterOnTap;

  const SliverAppBarLogoAndSearchAndBack({
    super.key,
    this.autofocus=false,
    this.withBackButton=false,
    this.backOnTap,
    this.fieldEnable=false,
    this.fieldOnTap,
    this.fieldOnChange,
    this.showClearButton=false,
    this.controller,
    this.clearOnTap,
    this.padding,
    this.withFilterButton=false,
    this.filterOnTap,
  });

  @override
  Widget build(BuildContext context) {
    // final helperSearchGeneric=Provider.of<HelperSearchGeneric>(context);

    return SliverLayoutBuilder(
        builder: (BuildContext context, constraints) {
          return SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            // backgroundColor: constraints.scrollOffset > 0?Colors.grey.shade900.withOpacity(0.8):Colors.transparent,
            floating: false,
            stretch: false,
            pinned: true,
            snap: false,
            primary: true,
            elevation: 20,
            scrolledUnderElevation: 0,
            backgroundColor: ColorConfig().scaffoldBackgroundColor(1),
            surfaceTintColor: ColorConfig().scaffoldBackgroundColor(1),
            shadowColor: ColorConfig().scaffoldBackgroundColor(1),
            foregroundColor: ColorConfig().scaffoldBackgroundColor(1),
            expandedHeight:SizeConfig.height*0.11,
            toolbarHeight: SizeConfig.height*0.065,
            titleSpacing: 0,
            centerTitle: true,
            leadingWidth: withBackButton?null:0,
            leading: VisibleWidget(
              visible: withBackButton,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: ColorConfig().blackColor(1),
                ),
                onPressed:backOnTap?? () => Navigator.pop(context),
              ),
            ),
            title:Image.asset(
              "assets/images/logo-no-background.png",
              width: SizeConfig.height * 0.1,
              color: ColorConfig().blackColor(1),
            ),
            bottom: PreferredSize(
              preferredSize: Size(SizeConfig.width, SizeConfig.height*0.07),
              child:Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // search bar
                      Expanded(
                        child: SizedBox(
                          height: SizeConfig.height*0.046,
                          child: GestureDetector(
                            onTap:fieldEnable?(){}:fieldOnTap??(){},
                            // ()=>StateMainSearchOnTap(context).onTap(context: context,),
                            child: Padding(
                              padding:padding??EdgeInsets.only(
                                right: withFilterButton?SizeConfig.height * 0.01:SizeConfig.height * 0.02,
                                left: SizeConfig.height * 0.02,
                              ),
                              child: CustomGenericSearchField(
                                controller: controller ?? TextEditingController(),
                                textInputAction: TextInputAction.done,
                                allowNumber: true,
                                autofocus: autofocus,
                                enabled: fieldEnable,
                                allowArabic: true,
                                withIcon: true,
                                textCapitalization: TextCapitalization.sentences,
                                // withButtonIcon: showClearButton&&context.read<HelperSearchGeneric>().showClearIconButton,
                                iconSize: SizeConfig.height * 0.0214,
                                buttonIconSize: SizeConfig.height * 0.017,
                                buttonIconColor: ColorConfig().primaryColor(0.6),
                                icon: "search_icon",
                                buttonIcon: "circle-xmark",
                                hintText: "search".tr,
                                onTap:fieldEnable?fieldOnTap??(){}:(){},
                                    // StateMainSearchOnTap(context).onTap(context: context,):(){},
                                onChanged:fieldOnChange?? (val)=>{},
                                buttonOnTap: showClearButton?clearOnTap:(){},
                                validator: (val) {
                                  return null;
                                },

                              ),
                            ),
                          ),
                        ),
                      ),



                      // filter
                      VisibleWidget(
                        visible: withFilterButton,
                        child: InkWell(
                          onTap:filterOnTap ,
                          child: Container(
                            height: SizeConfig.height*0.06,
                            width: SizeConfig.height*0.06,
                            decoration: BoxDecoration(
                              color: ColorConfig().whiteColor(1),
                              borderRadius: BorderRadius.circular(SizeConfig.height * .012),
                              border: Border.all(
                                color: ColorConfig().greyBlackColor(0.3),
                                width: 0.5,
                              ),
                            ),
                            child:  Center(
                              child: SvgPicture.asset(
                                "assets/icons/Icon-filter.svg",
                                width: SizeConfig.height*0.025,
                                height:SizeConfig.height*0.025 ,
                                colorFilter: ColorFilter.mode(ColorConfig().greyBlackColor(1), BlendMode.srcIn,),
                              ),
                            ),
                          ),
                        ),
                      ),

                      VisibleWidget(
                        visible: withFilterButton,
                        child: 0.02.widthBox,
                      ),
                    ],
                  ),
                  0.01.heightBox,
                ],
              ),
            ),
          );
        }
    );
  }
}

class SliverAppBarLogo extends StatelessWidget {
  final VoidCallback? backOnTap;
  final bool withBackButton;
  final VoidCallback? fieldOnTap;
  final Function(String val)? fieldOnChange;
  final bool fieldEnable;
  final bool showClearButton;
  final bool autofocus;
  final VoidCallback? clearOnTap;
  final EdgeInsets? padding;
  final TextEditingController? controller;
  final bool withFilterButton;
  final VoidCallback? filterOnTap;
  final Widget? titleWidget;

  const SliverAppBarLogo({
    super.key,
    this.autofocus=false,
    this.withBackButton=false,
    this.backOnTap,
    this.fieldEnable=false,
    this.fieldOnTap,
    this.fieldOnChange,
    this.showClearButton=false,
    this.controller,
    this.clearOnTap,
    this.padding,
    this.withFilterButton=false,
    this.filterOnTap,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    // final helperSearchGeneric=Provider.of<HelperSearchGeneric>(context);

    return SliverLayoutBuilder(
       builder: (BuildContext context, constraints) => SliverAppBar(
         systemOverlayStyle: SystemUiOverlayStyle.dark,
         floating: false,
         stretch: false,
         pinned: true,
         snap: false,
         primary: true,
         elevation: 20,
         scrolledUnderElevation: 0,
         backgroundColor: ColorConfig().scaffoldBackgroundColor(1),
         surfaceTintColor: ColorConfig().scaffoldBackgroundColor(1),
         shadowColor: ColorConfig().scaffoldBackgroundColor(1),
         foregroundColor: ColorConfig().scaffoldBackgroundColor(1),
         // expandedHeight:SizeConfig.height*0.06,
         toolbarHeight: SizeConfig.height*0.065,
         titleSpacing: 0,
         centerTitle: true,
         leadingWidth: withBackButton? null:0,
         leading: VisibleWidget(
              visible: withBackButton,
              child: InkWell(
                // padding: EdgeInsets.zero,
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: ColorConfig().blackColor(1),
                ),
                onTap:backOnTap?? () => Navigator.pop(context),
              ),
            ),
         title:Image.asset(
              "assets/images/logo-no-background.png",
              width: SizeConfig.height * 0.1,
              color: ColorConfig().blackColor(1),
              // width: SizeConfig.height * 0.2,
              // height: SizeConfig.height * 0.2,
              // color: ColorConfig().blackColor(1),
            ),
         bottom: PreferredSize(
           preferredSize: titleWidget != null ? Size(SizeConfig.width, SizeConfig.height*0.04) :Size(0, 0),
           child: titleWidget ?? const SizedBox(),
         ),
       ),
    );
  }
}

class SliverAppBarTitleOnly extends StatelessWidget {
  final VoidCallback? backOnTap;
  final bool withBackButton;
  final VoidCallback? fieldOnTap;
  final Function(String val)? fieldOnChange;
  final bool fieldEnable;
  final bool showClearButton;
  final bool autofocus;
  final VoidCallback? clearOnTap;
  final EdgeInsets? padding;
  final TextEditingController? controller;
  final bool withFilterButton;
  final VoidCallback? filterOnTap;
  final String title;

  const SliverAppBarTitleOnly({
    super.key,
    this.autofocus=false,
    this.withBackButton=false,
    this.backOnTap,
    this.fieldEnable=false,
    this.fieldOnTap,
    this.fieldOnChange,
    this.showClearButton=false,
    this.controller,
    this.clearOnTap,
    this.padding,
    this.withFilterButton=false,
    this.filterOnTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // final helperSearchGeneric=Provider.of<HelperSearchGeneric>(context);

    return SliverLayoutBuilder(
        builder: (BuildContext context, constraints) {
          return SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            // backgroundColor: constraints.scrollOffset > 0?Colors.grey.shade900.withOpacity(0.8):Colors.transparent,
            floating: false,
            stretch: false,
            pinned: true,
            snap: false,
            primary: true,
            elevation: 20,
            scrolledUnderElevation: 0,
            backgroundColor: ColorConfig().scaffoldBackgroundColor(1),
            surfaceTintColor: ColorConfig().scaffoldBackgroundColor(1),
            shadowColor: ColorConfig().scaffoldBackgroundColor(1),
            foregroundColor: ColorConfig().scaffoldBackgroundColor(1),
            // expandedHeight:SizeConfig.height*0.06,
            toolbarHeight: SizeConfig.height*0.065,
            titleSpacing: 0,
            centerTitle: true,
            leadingWidth: withBackButton?null:0,
            leading: VisibleWidget(
              visible: withBackButton,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: ColorConfig().blackColor(1),
                ),
                onPressed:backOnTap?? () => Navigator.pop(context),
              ),
            ),
            title: TextDefaultWidget(
              title: title,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorConfig().blackColor(1),
            ),
          );
        }
    );
  }
}

