import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:flutter/material.dart';

// islam remove
class LoadingScreen extends StatelessWidget {
  final Widget child;
  final bool loading, withDropdown;
  const LoadingScreen(
      {Key? key,
      required this.child,
      this.loading = false,
      this.withDropdown = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            child,
            loading
                ? Positioned.fill(
                    child: Container(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  )
                : const SizedBox(),
            loading
                ? Positioned(
                    child: CircularProgressIndicator(
                      color: withDropdown == true
                          ? Colors.transparent
                          : ColorConfig().primaryColor(1),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
