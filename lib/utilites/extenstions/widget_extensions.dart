import 'package:flutter/material.dart';

extension WidgetPadding on Widget {

  /// Padding
  Widget paddingAll(double? paddingAll) {
    return Padding(
      padding: EdgeInsets.all(paddingAll??0),
      child: this,
    );
  }

  Widget paddingSymmetric({double? horizontal, double? vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal ??0,vertical: vertical??0),
      child: this,
    );
  }

  Widget paddingHorizontal({double? horizontal}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal??0),
      child: this,
    );
  }

  Widget paddingVertical({double? vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical??0),
      child: this,
    );
  }

  Widget paddingOnly({double? start, double? end, double? top, double? bottom}) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: start??0, end: end??0, top: top??0,bottom: bottom??0),
      child: this,
    );
  }



  /// to position widget at the center
  Widget get toCenter => Center(child: this);



}