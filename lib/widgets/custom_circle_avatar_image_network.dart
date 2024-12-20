// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
//
// class CustomCircleAvatarImageNetwork extends StatelessWidget {
//   final String image;
//   final String errorImage;
//   final BoxFit fit;
//   final BoxFit errorFit;
//   final Color errorBackground;
//   final Color loadingColor;
//   final double errorImageSize;
//   final EdgeInsets errorPadding;
//   final Alignment? errorAlignment;
//   final double height;
//   final double width;
//
//   const CustomCircleAvatarImageNetwork({
//     Key? key,
//     required this.image,
//     required this.height,
//     required this.width,
//     required this.fit,
//     required this.errorBackground,
//     required this.errorFit,
//     required this.errorImage,
//     required this.errorImageSize,
//     required this.loadingColor,
//     required this.errorPadding,
//     this.errorAlignment,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if(image.isEmpty){
//       return Container(
//         width:width,
//         height: height,
//         margin: errorPadding,
//         decoration: BoxDecoration(
//             color: errorBackground,
//           shape: BoxShape.circle
//         ),
//         child: Center(
//           child: Image.asset(
//             'assets/images/$errorImage',
//             width: errorImageSize,
//             height: errorImageSize,
//             fit: errorFit,
//             alignment: errorAlignment!=null?errorAlignment!:Alignment.center,
//           ),
//         ),
//       );
//
//     }
//     return CachedNetworkImage(
//       fit: fit,
//       alignment: Alignment.center,
//       imageUrl: image.toString(),
//       imageBuilder: (context,imageProvider)=>Container(
//         width:width,
//         height: height,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           image: DecorationImage(
//               image: imageProvider, fit: BoxFit.cover),
//         ),
//
//       ),
//
//       placeholder:(context, error,) {
//         return CupertinoActivityIndicator(
//           radius:  SizeConfig.height * 0.013,
//           color: ColorConfig().loadingGrey3Color(0.4),
//         );
//       },
//
//       errorWidget: (context, error, stackTrace) {
//         return Container(
//           width:width,
//           height: height,
//           decoration: BoxDecoration(
//             color: errorBackground,
//             shape: BoxShape.circle
//           ),
//
//           margin: errorPadding,
//           child: Center(
//             child: Image.asset(
//               'assets/images/$errorImage',
//               width: errorImageSize,
//               height: errorImageSize,
//               fit: errorFit,
//               alignment: errorAlignment!=null?errorAlignment!:Alignment.center,
//             ),
//           ),
//         );
//       },
//     );
//
//   }
// }
