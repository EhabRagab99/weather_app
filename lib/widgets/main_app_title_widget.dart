import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/widgets/default_text_widget.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainAppTitleWidget extends StatelessWidget {
  const MainAppTitleWidget({super.key, required this.title, this.titleTextStyle, this.counter});
  final String title;
  final String? counter;
  final TextStyle? titleTextStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/2circle.svg',
          height: SizeConfig.height * .011,
          width: SizeConfig.height * .011,
          colorFilter: ColorFilter.mode(
             ColorConfig().primaryColor(1),
            BlendMode.srcIn,
          ),
        ),
        .005.widthBox,
          TextDefaultWidget(
            title: title,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorConfig().blackColor(1),
          ),
        .005.widthBox,
        VisibleWidget(
          visible: counter != null,
          child: Container(
            alignment: AlignmentDirectional.center,
            padding: EdgeInsets.all(SizeConfig.height * 0.005),
            decoration: BoxDecoration(
              color: ColorConfig().greyLightColor(1),
              borderRadius: BorderRadius.circular(SizeConfig.height * 0.002)
            ),
            child: TextDefaultWidget(
              title: counter ?? '',
              fontSize: SizeConfig.height * 0.012,
              // fontWeight: FontWeight.bold,
              color: ColorConfig().blackColor(1),
            ),
          ),
        ),
      ],
    );
  }
}
