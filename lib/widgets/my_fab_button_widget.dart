import 'dart:math';

import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:flutter/material.dart';

class MyFabButton extends StatelessWidget {
  final bool isExtended;
  final void Function()? onPressed;
  final String title;
  const MyFabButton({required this.isExtended, super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      transform: !isExtended
          ? Matrix4.rotationZ(0.05 * pi)
          : Matrix4.rotationZ(0),
      child: RawMaterialButton(
        elevation: 5.0,
        shape: isExtended ? const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))) : const CircleBorder(),
        onPressed: onPressed,
        fillColor: ColorConfig().primaryColor(1),

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: isExtended ? Row(
            mainAxisSize: MainAxisSize.min,
            children:  [
              const Icon(Icons.add, color: Colors.white),
              const SizedBox(width: 5.0),
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ) : const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
