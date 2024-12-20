import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:flutter/material.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._tabBar);

  final Widget _tabBar;

  @override
  double get minExtent => AppBar().preferredSize.height.toDouble();
  @override
  double get maxExtent => AppBar().preferredSize.height.toDouble();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: SizeConfig.height * 0.08,
      decoration: BoxDecoration(color: ColorConfig().whiteColor(1)),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
