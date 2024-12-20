// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/service/api_handler/general_api_state.dart';
// // import 'package:iem_app/pages/bar_categories/model/product_model.dart';
// // import 'package:iem_app/pages/single_product/provider/helper/product_details_helper.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class CustomCarouselWidget extends StatefulWidget {
//   final List<Widget>? imagesList;
//   // final List<MediaModel> mediaModel;
//   final dynamic mediaModel;
//   final Function(int value, CarouselPageChangedReason reason) onPageChange;
//
//   const CustomCarouselWidget({
//     super.key,
//     this.imagesList,
//     required this.mediaModel,
//     required this.onPageChange
//   });
//
//   @override
//   State<CustomCarouselWidget> createState() => _CustomCarouselWidgetState();
// }
//
// class _CustomCarouselWidgetState extends State<CustomCarouselWidget> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     // return Consumer<ProductDetailsHelper>(
//     return Consumer<GeneralApiState>(
//         builder: (context, productDetailsHelper, child) {
//       return SizedBox(
//         width: SizeConfig.width,
//         child: CarouselSlider(
//           // carouselController:productDetailsHelper.sliderController,
//           options: CarouselOptions(
//             autoPlay: false,
//             enableInfiniteScroll: false,
//             viewportFraction: 1.9,
//             autoPlayCurve: Curves.bounceIn,
//             initialPage: 0,
//             height: SizeConfig.height * 0.43,
//             onPageChanged: widget.onPageChange
//           ),
//           items: widget.imagesList,
//         ),
//       );
//     });
//   }
//
//   // Container buildDot(int index, BuildContext context) {
//   //   return Container(
//   //     height: widget.currentIndex == index ? 15.h : 10.h,
//   //     width: widget.currentIndex == index ? 15.w : 10.w,
//   //     margin: EdgeInsets.only(right: 5.w),
//   //     decoration: BoxDecoration(
//   //       borderRadius: BorderRadius.circular(10.r),
//   //       color: widget.currentIndex == index
//   //           ? ThemeClass.whiteColor
//   //           : Colors.grey.withOpacity(0.2),
//   //       border: Border.all(
//   //         color: widget.currentIndex == index
//   //             ? ThemeClass.whiteColor
//   //             : Colors.grey.withOpacity(0.2),
//   //       ),
//   //     ),
//   //   );
//   // }
// }
