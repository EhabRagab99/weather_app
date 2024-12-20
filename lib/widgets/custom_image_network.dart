import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class CustomImageNetwork extends StatelessWidget {
  final String? image;
  final String? errorImage;
  final BoxFit? fit;
  final BoxFit? errorFit;
  final Color? errorBackground;
  final Color? loadingColor;
  final double? errorImageSize;
  final EdgeInsets? errorPadding;
  final Alignment? errorAlignment;
  final bool? showOnTap;

  const CustomImageNetwork({
    super.key,
    this.image,
    this.fit,
    this.errorBackground,
    this.errorFit,
    this.errorImage,
    this.errorImageSize,
    this.loadingColor,
    this.errorPadding,
    this.errorAlignment,
    this.showOnTap = false,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      width: double.infinity,
      alignment: Alignment.center,
      imageUrl: image.toString(),
      placeholder: (context, error,) {
        return CupertinoActivityIndicator(
          radius: SizeConfig.height * 0.013,
          color: ColorConfig().primaryColor(0.4),
        );
      },
      errorWidget: (context, error, stackTrace) {
        return Container(
          color: errorBackground,
          margin: errorPadding,
          child: Center(
            child: Image.asset(
              'assets/images/img_not_available.jpeg',
              width: errorImageSize,
              height: errorImageSize,
              fit: BoxFit.cover,
              alignment: errorAlignment != null ? errorAlignment! : Alignment.center,
            ),
          ),
        );
      },
    );
  }
}
