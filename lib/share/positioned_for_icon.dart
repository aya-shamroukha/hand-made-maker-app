import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/config/local_storage/shared_preferences.dart';
import '../../core/resources/app_color.dart';

class PositionedForIcon extends StatelessWidget {
  const PositionedForIcon({
    super.key,
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.icon,
    this.onPressed,
    this.color,
    this.iconColor,
  });
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: getIt.get<SharedPreferences>().getString('languagecode') == 'ar'
          ? 0
          : 0,
      right: null,
      bottom: bottom,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            color: AppColor.brownText,
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
              color ?? AppColor.primary,
            )),
            onPressed: onPressed ??
                () {
                  Navigator.of(context).pop();
                },
            icon: Icon(
              getIt.get<SharedPreferences>().getString('languagecode') == 'ar'
                  ? Icons.arrow_forward
                  : Icons.arrow_back,
              color: iconColor ?? AppColor.background,
              size: 20,
            )),
      ),
    );
  }
}
