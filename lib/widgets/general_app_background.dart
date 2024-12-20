import 'dart:math' as math;
import 'package:iem_app/utilites/app_size_config.dart';
import 'package:flutter/material.dart';

class GeneralAppBackground extends StatelessWidget {
  final Widget child;
  const GeneralAppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: SizeConfig.width,
          height: SizeConfig.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFf77080),
                // Color(0xff42DEBF),
                Color(0xff6CA5C2),
                Color(0xff4876B2),
                Color(0xFF000000),
                // Color(0xffDaEcD8),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
          ),
        ),
        child,
      ],
    );
  }

}

class OvalCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
      ..color = const Color(0xffF0C929).withOpacity(0.25)
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.translate(size.width * 0.5, size.height * 0.5);
    canvas.rotate(-math.pi / 1.7);
    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: 300, height: 800,), circlePaint,);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
