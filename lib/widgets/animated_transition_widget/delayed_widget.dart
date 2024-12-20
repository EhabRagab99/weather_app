import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';

class DelayedWidget extends StatefulWidget {
  final Widget child;
  final int seconds;

  const DelayedWidget({
    super.key,
    required this.child,
    required this.seconds,
  });

  @override
  State<DelayedWidget> createState() => _DelayedWidgetState();
}

class _DelayedWidgetState extends State<DelayedWidget> {
  late bool _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = false;

    Future.delayed(Duration(seconds: widget.seconds), () {
      if (mounted) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibleWidget(
      visible: _isVisible,
      child: widget.child,
    );
  }
}
