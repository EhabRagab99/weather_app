import 'package:iem_app/helpers/preview_helper/show_photo_review.dart';
import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:flutter/material.dart';

extension OnTapFadeImageExtension on FadeInImage {
  Widget showOnTap(BuildContext context) {
    return InkWell(
      onTap: () {
        customPushNavigator(
            context,
            MultiImageViewWidget(
              networkImagesList: const [],
              // assetImagesList: const [],
              image: image,
            ));
      },
      child: this,
    );
  }
}
