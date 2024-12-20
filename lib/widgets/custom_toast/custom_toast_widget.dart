import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/custom_stack_widget.dart';
import 'package:flutter/material.dart';


class CustomToastWidget extends StatelessWidget {
  final String message;
  final ToastType toastType;
  const CustomToastWidget({super.key, required this.message, required this.toastType});

  @override
  Widget build(BuildContext context) {
    return CustomStackWidget(
    children: [
      Container(
        decoration: BoxDecoration(
          color: toastType == ToastType.success ?
          ColorConfig().greenColor(1) : toastType == ToastType.error ? ColorConfig().redColor(1) : ColorConfig().yellowColor(1),
          borderRadius:  BorderRadius.circular(SizeConfig.height * 0.006,),
        ),
        constraints: BoxConstraints(
          minHeight: SizeConfig.height * 0.1,
          // maxHeight: SizeConfig.height * 0.1,
        ),
      ),
      PositionedDirectional(
        start: SizeConfig.height * 0.004,
        top: SizeConfig.height * 0.0001,
        end: 0,
        child: Container(
          height: SizeConfig.height * 0.1,
          width: SizeConfig.height * 0.422,
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.height * 0.008, vertical: SizeConfig.height * 0.01,
          ),
          decoration: BoxDecoration(
            color: ColorConfig().whiteColor(1),
            borderRadius: BorderRadius.circular(SizeConfig.height * 0.006),
            boxShadow: [
              BoxShadow(
                color: ColorConfig().blackColor(0.3),
                blurRadius: SizeConfig.height * 0.006,
                offset: Offset(0, SizeConfig.height * 0.006),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                 toastType == ToastType.success
                    ? "success".tr
                    : toastType == ToastType.error
                    ? "error".tr
                    : "warning".tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: toastType == ToastType.success
                      ? ColorConfig().greenColor(1)
                      : toastType == ToastType.error
                      ? ColorConfig().redColor(1)
                      : ColorConfig().yellowColor(1),
                  // fontSize:
                ),
              ),
              0.004.heightBox,
              Flexible(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(color: ColorConfig().blackColor(1),),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
    );
  }
}
