// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/shared_preference.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/color_foreground_check.dart';
// import 'package:iem_app/pages/bar_home/provider/helper/state_add_home_product_to_cart.dart';
// import 'package:iem_app/pages/bar_home/view/widget/cart_widget.dart';
// import 'package:iem_app/pages/bar_home/view/widget/offer_label.dart';
// import 'package:iem_app/pages/bar_home/view/widget/wish_button.dart';
// import 'package:iem_app/service/api_handler/api_state.dart';
// import 'package:iem_app/utils/extensions/app_size_boxes.dart';
// import 'package:iem_app/widgets/custom_image_network.dart';
// import 'package:iem_app/widgets/loading/loading_widget.dart';
// import 'package:iem_app/widgets/visible_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class ProductItemWidget extends StatelessWidget {
//   const ProductItemWidget({super.key, required this.product, required this.onTab, required this.onWishlistTab, required this.labelModel});
//
//   final ProductItemModel product;
//   final VoidCallback onTab;
//   final VoidCallback onWishlistTab;
//   final LabelModel labelModel;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<GeneralApiState>(
//       builder: (context,provider,child) {
//         return GestureDetector(
//           onTap: onTab,
//           child: Stack(
//             children: [
//               Container(
//                 width: SizeConfig.width * 0.44,
//                 padding: EdgeInsets.all(SizeConfig.height * 0.0050),
//                 decoration: BoxDecoration(
//                   color: ColorConfig().greyLightColor(1),
//                   borderRadius: BorderRadius.circular(SizeConfig.height * 0.0114),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // image
//                     Expanded(
//                       child: Padding(
//                         padding:EdgeInsets.all(SizeConfig.height*.002),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(SizeConfig.height * 0.01),
//                           child: CustomImageNetwork(
//                             image: product.prdouctImageUrl,
//                             fit: BoxFit.cover,
//                             loadingColor: ColorConfig().primaryColor(1),
//                             errorBackground: ColorConfig().greyBlackColor(.2),
//                             errorImage: 'image_null.png',
//                             errorFit: BoxFit.contain,
//                             errorImageSize: SizeConfig.height * 0.06,
//                             errorPadding: EdgeInsets.zero,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     0.0038.heightBox,
//
//                     //product name
//                     Padding(
//                       padding:EdgeInsets.all(SizeConfig.height*.0050),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             product.name,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorConfig().secondaryColor(1),),),
//
//                           .002.heightBox,
//
//                            /// todo use product brands widget
//                           //subtitle
//                           Text(
//                             !product.manufacturers.map((brand) => brand.name).toList().contains('null')?product.manufacturers.map((brand) => brand.name).toList().join(' | ').toString():'',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorConfig().blackColor(1)),
//                           ),
//
//                           .008.heightBox,
//
//                           //salary and cart
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Row(
//                                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                                     textBaseline: TextBaseline.ideographic,
//                                     children: [
//                                       Text(
//                                         product.prices.price.toString(),
//                                         textAlign: TextAlign.center,
//                                         style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorConfig().secondaryColor(1),),
//                                       ),
//
//                                       .0050.widthBox,
//
//                                       Text(
//                                         UserDataFromStorage.currencyCodeFromStorage,
//                                         textAlign: TextAlign.center,
//                                         style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorConfig().secondaryColor(1),),
//                                       ),
//                                     ],
//                                   ),
//                                   .001.heightBox,
//                                   VisibleWidget(
//                                     visible: product.prices.oldPrice.toInt()>0,
//                                     child: Row(
//                                       crossAxisAlignment: CrossAxisAlignment.baseline,
//                                       textBaseline: TextBaseline.ideographic,
//                                       children: [
//                                         Text(
//                                           product.prices.oldPrice.toString(),
//                                           textAlign: TextAlign.center,
//                                           style: Theme.of(context).textTheme.labelLarge!.copyWith(decoration: TextDecoration.lineThrough,color: ColorConfig().greyBlackColor(1)),
//                                         ),
//
//                                         .0050.widthBox,
//
//                                         Text(
//                                           UserDataFromStorage.currencyCodeFromStorage,
//                                           textAlign: TextAlign.center,
//                                           style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorConfig().greyBlackColor(1), decoration: TextDecoration.lineThrough,),
//                                         ),
//
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                               // cart
//                               VisibleWidget(
//                                 visible:product.cart.cartAllowable,
//                                 child: Visibility(
//                                   visible: true,
//                                   replacement: const LoadingAnimationWidget(),
//                                   child:CartWidget(
//                                     product: product,
//                                     onCartTap:()=> StateAddHomeProductToCart(context).cartClick(context: context, product: product),
//                                   ),
//                                 ),
//                               ),
//
//                             ],
//                           ),
//
//                           .002.heightBox,
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               // wishButton
//               PositionedDirectional(
//                 top: SizeConfig.height * 0.013,
//                 end: SizeConfig.height * 0.011,
//                 child: WishButton(wishSelected: product.isWishlist,onWishlistTab: onWishlistTab,),
//               ),
//
//               //offers buttons
//               PositionedDirectional(
//                 top: SizeConfig.height * 0.013,
//                 start: SizeConfig.height * 0.011,
//                 child: OfferLabel(
//                   color: getColorFromHex(labelModel.color),
//                   offerText: product.label.name,
//                   offerVisible: product.label.name!='',
//                 ),
//               ),
//             ],
//           ),
//         );
//       }
//     );
//   }
// }
