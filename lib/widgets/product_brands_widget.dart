// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/pages/bar_categories/model/product_model.dart';
// import 'package:flutter/material.dart';
//
// class ProductBrandsWidget extends StatelessWidget {
//   final List<Manufacturer> manufacturers;
//
//   const ProductBrandsWidget({Key? key,required this.manufacturers}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Text(
//       !manufacturers.map((brand) => brand.name).toList().contains('null')?manufacturers.map((brand) => brand.name).toList().join(' | ').toString():'',
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//       style: Theme.of(context).textTheme.labelLarge!.copyWith(color: ColorConfig().greyBlackColor(1)),
//     );
//   }
// }
