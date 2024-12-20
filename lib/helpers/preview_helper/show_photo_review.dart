import 'dart:io';

import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

showMultiPhotoView({
  required BuildContext context,
  List<String>? networkImagesList,
  List<File>? assetImagesList,
  Color? activeColor,
  int currentIndex = 0,
  final ImageProvider? image,
}) async {
  return showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    elevation: 0,
    barrierColor: ColorConfig().appbarBackgroundColor(0.01),
    // duration: const Duration(milliseconds: 250),
    // animationCurve: Curves.linearToEaseOut,
    // animationCurve: Curves.fastLinearToSlowEaseIn,
    // backgroundColor: Colors.transparent,
    // expand: true,
    isScrollControlled: true,
    isDismissible: false,
    builder: (context) => MultiImageViewWidget(
      networkImagesList: networkImagesList ?? [],
      // assetImagesList: assetImagesList ?? [],
      image: image,
      activeColor: activeColor,
      currentIndex: currentIndex,
    ),
  );
}

// showSinglePhotoView({required BuildContext context ,required String image,}) async {
//
//   return showMaterialModalBottomSheet(
//     context: context,
//     elevation: 0,
//     barrierColor: ColorConfig().appbarBackgroundColor(0.01),
//     duration: const Duration(milliseconds: 250),
//     // animationCurve: Curves.elasticInOut,
//     animationCurve: Curves.fastLinearToSlowEaseIn,
//     backgroundColor: Colors.transparent,
//     expand: true,
//     isDismissible: false,
//     builder: (context) => SingleImageView(
//       image: image,
//     ),
//   );
//
// }

class MultiImageViewWidget extends StatefulWidget {
  final List<String> networkImagesList;
  final Color? activeColor;
  final int? currentIndex;
  final ImageProvider? image;
  const MultiImageViewWidget(
      {super.key,
        required this.networkImagesList,
        this.activeColor,
        this.currentIndex,
        this.image});
  @override
  State<MultiImageViewWidget> createState() => _MultiImageViewWidgetState();
}

class _MultiImageViewWidgetState extends State<MultiImageViewWidget> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: widget.currentIndex ?? 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorConfig().scaffoldBackgroundColor(1),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Expanded(
                  child: PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    customSize: Size(SizeConfig.width * 0.9, SizeConfig.height),
                    pageController: pageController,
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: widget.image ??
                            NetworkImage(
                              widget.networkImagesList[index].toString(),
                            ),
                        initialScale: PhotoViewComputedScale.contained,
                        // heroAttributes: PhotoViewHeroAttributes(tag: widget.imageList[index]),
                        minScale: PhotoViewComputedScale.contained * 0.5,
                        filterQuality: FilterQuality.medium,
                        basePosition: Alignment.center,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Image.asset(
                              'assets/images/img_not_available.jpeg',
                              width: SizeConfig.height * 0.1155,
                              height: SizeConfig.height * 0.1155,
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                          );
                        },
                        tightMode: false,
                      );
                    },
                    itemCount: widget.networkImagesList.length,
                    loadingBuilder: (context, event) => Center(
                      child: SizedBox(
                        width: SizeConfig.height * 0.035,
                        height: SizeConfig.height * 0.035,
                        child: CircularProgressIndicator(
                          value: event == null
                              ? 0
                              : event.cumulativeBytesLoaded /
                              event.expectedTotalBytes!,
                        ),
                      ),
                    ),
                    backgroundDecoration: BoxDecoration(
                      color: ColorConfig().scaffoldBackgroundColor(1),
                    ),
                    // enableRotation: true,
                    enableRotation: false,
                    gaplessPlayback: true,
                    reverse: false,
                    onPageChanged: (b) {},
                  ),
                ),
              ],
            ),
            // close
            PositionedDirectional(
              top: SizeConfig.height * 0.08,
              start: SizeConfig.height * 0.008,
              child: SafeArea(
                child: CustomLoginBackButton(
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleImageView extends StatefulWidget {
  final String image;
  const SingleImageView({super.key, required this.image});
  @override
  State<SingleImageView> createState() => _SingleImageViewState();
}

class _SingleImageViewState extends State<SingleImageView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorConfig().appbarBackgroundColor(1)
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return PhotoView(
                        imageProvider: NetworkImage(
                          widget.image.toString(),
                        ),
                        initialScale: PhotoViewComputedScale.contained,
                        // ignore: prefer_const_constructors
                        backgroundDecoration: BoxDecoration(
                            color: ColorConfig().appbarBackgroundColor(1)
                        ),
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: ColorConfig().primaryColor(1),
                            child: Center(
                              child: Image.asset(
                                'assets/images/image_null.png',
                                width: SizeConfig.height * 0.1155,
                                height: SizeConfig.height * 0.1155,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                        loadingBuilder: (context, event) => Center(
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              value: event == null ? 0 : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                              color: ColorConfig().primaryColor(1),
                            ),
                          ),
                        ),
                        // heroAttributes: const PhotoViewHeroAttributes(tag: "one",),
                      );
                    },
                    itemCount: 1,
                    onPageChanged: (val) {},
                  ),
                ),
              ],
            ),

            // close
            Positioned(
              top: SizeConfig.height * 0.0185,
              left: SizeConfig.height * 0.0185,
              child: SafeArea(
                child: CustomLoginBackButton(
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ));
  }
}

class FileView extends StatefulWidget {
  final String image;
  const FileView({super.key, required this.image});
  @override
  State<SingleImageView> createState() => _SingleImageViewState();
}
