import 'dart:io';

import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utilites/app_size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingAnimationWidget extends StatefulWidget {
  final double? size;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const LoadingAnimationWidget({super.key,this.size, this.color,this.padding,});


  @override
  State<LoadingAnimationWidget> createState() => _LoadingAnimationWidgetState();
}

class _LoadingAnimationWidgetState extends State<LoadingAnimationWidget> {

  normalLoading({double? size,EdgeInsetsGeometry? padding,}){
    return Platform.isIOS ? Container(
      color: Colors.transparent,
      margin: padding ,
      width: size ?? SizeConfig.height * 0.075,
      height: size ?? SizeConfig.height * 0.075,
      child: CupertinoActivityIndicator(
        radius: size ?? SizeConfig.height * 0.02,
        color: widget.color ?? ColorConfig().primaryColor(1),
      )
    ): CircularProgressIndicator(
      color: ColorConfig().primaryColor(1),
    );
  }


  @override
  Widget build(BuildContext context) {
    return normalLoading(size:widget.size,padding: widget.padding??EdgeInsets.zero );
  }
}
