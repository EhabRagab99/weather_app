import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class SeeMoreWidget extends StatelessWidget {
  final VoidCallback onSeeMoreClick;
  const SeeMoreWidget({Key? key,required this.onSeeMoreClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onSeeMoreClick,
      child: Column(
        children: [
          Text(
            'seeMore'.tr,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorConfig().primaryColor(1)),
          ),
          SizedBox(
            width: SizeConfig.height*.08,
            child: Divider(
              color: ColorConfig().secondaryColor(1),
              height: 1,
              thickness: 1,

            ),
          )
        ],
      ),
    );
  }
}
