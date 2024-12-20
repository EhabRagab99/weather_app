import 'package:flutter/material.dart';

class CustomGradientButtonWidget extends StatelessWidget {
  final GradientPainter _painter;
  final String title;
  final void Function()? _callback;
  final Color _color;
  final double? width, height, verticalPadding;
  final bool? isGradient;

  CustomGradientButtonWidget(
      {super.key,
      required this.title,
      final void Function()? onPressed,
      Color? color,
      this.width,
      this.isGradient = true,
      this.height,
      this.verticalPadding})
      : _painter = GradientPainter(
          strokeWidth: 2,
          gradient: const LinearGradient(colors: [
            Color(0xff42DEBF),
            Color(0xff6CA5C2),
            Color(0xff6CA5C2),
            Color(0xff315FAA),
            Color(0xff315FAA),
            Color(0xff4876B2),
          ]),
        ),
        _callback = onPressed,
        _color = color ?? const Color(0xff070707);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: isGradient == true ? _painter : null,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: _callback,
          child: Container(
            // height: 200.h,
            // width: 321.w,
            padding: const EdgeInsets.all(1.6),
            // constraints: BoxConstraints(minWidth: 88.w, minHeight: 50.h),
            child: Container(
              alignment: AlignmentDirectional.center,
              padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 14),
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double strokeWidth;
  final Gradient gradient;

  GradientPainter({required this.strokeWidth, required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, const Radius.circular(30));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect =
        RRect.fromRectAndRadius(innerRect, Radius.circular(30 - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
