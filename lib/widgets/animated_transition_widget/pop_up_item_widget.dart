import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';

class PopUpItemWidget extends StatelessWidget {
  const PopUpItemWidget({
    Key? key,
    required this.title,
    required this.iconPAth,
    this.lastItem = false,
    required this.value, this.onTap, this.color,
  }) : super(key: key);

  final String title, iconPAth;
  final bool? lastItem;
  final void Function()? onTap;
  final Color? color;

  final int value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: SizeConfig.height * 0.015,
                  color: ColorConfig().greyBlackColor(1),

              ),
            ),
            VisibleWidget(
                visible: lastItem == false,
                child: Divider(
                  color: ColorConfig().greyColor(1),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
