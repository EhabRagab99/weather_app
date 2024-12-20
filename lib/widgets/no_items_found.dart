import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoItemsInList extends StatelessWidget {

  final String emptyString;
  const NoItemsInList({super.key, required this.emptyString});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        0.02.heightBox,

        Center(
          child: Lottie.asset(
            'assets/gif/NEW sin movs.json',
            height: SizeConfig.height *0.37,
            width: SizeConfig.height *0.37,
            fit: BoxFit.cover,
          ),
        ),

        0.05.heightBox,

        Text(
          emptyString.tr,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorConfig().secondaryColor(1),),
        ),

      ],
    );
  }
}
