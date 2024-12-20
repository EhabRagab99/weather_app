import 'package:flutter/material.dart';


class ShakeWidget extends StatefulWidget {
  final Duration duration;
  final double deltaX;
  final Widget child;
  final Curve curve;
  final bool makeShake;

  const ShakeWidget({
    Key? key,
    this.duration = const Duration(milliseconds: 500),
    this.deltaX = 20,
    this.curve = Curves.bounceOut,
    this.makeShake = false,
    required this.child,
  }) : super(key: key);

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget> {
  /// convert 0-1 to 0-1-0
  double shake(double animation) =>
      2 * (0.5 - (0.5 - widget.curve.transform(animation)).abs());

  @override
  Widget build(BuildContext context) {
    // print(widget.makeShake);
    return widget.makeShake == true
        ? KeyedSubtree(
            child: TweenAnimationBuilder<double>(
              key: ValueKey<bool>(widget.makeShake),
              tween: Tween(begin: 0.0, end: 1.0),
              duration: widget.duration,
              builder: (context, animation, child) => Transform.translate(
                offset: Offset(widget.deltaX * shake(animation), 0),
                child: child,
              ),
              child: widget.child,
            ),
          )
        : Container(
            child: widget.child,
          );
  }
}

///old

// import 'package:flutter/material.dart';
// class ShakingWidget extends StatefulWidget {
//   final bool shake;
//   final Color color;
//   final Widget child;
//
//   const ShakingWidget({
//     Key? key,
//     required this.shake,
//     required this.color,
//     required this.child,
//   }) : super(key: key);
//
//   @override
//   _ShakingWidgetState createState() => _ShakingWidgetState();
// }
//
// class _ShakingWidgetState extends State<ShakingWidget> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     )..repeat(reverse: true);
//
//     _animation = Tween<double>(begin: -0.05, end: 0.05).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return widget.shake
//             ? TweenAnimationBuilder(
//           tween: Tween<double>(begin: 0, end: 1),
//           duration: const Duration(milliseconds: 500),
//           builder: (context, double value, child) {
//             return Transform.rotate(
//               angle: _animation.value * value,
//               child: child,
//             );
//           },
//           child: Container(
//             width: constraints.maxWidth,
//             height: constraints.maxHeight,
//             color: widget.color,
//             child: widget.child,
//           ),
//         )
//             : Container(
//           width: constraints.maxWidth,
//           height: constraints.maxHeight,
//           color: widget.color,
//           child: widget.child,
//         );
//       },
//     );
//   }
// }
