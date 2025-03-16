// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import '../../core/resources/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height,
    this.width,
    required this.onPressed,
    this.background,
    required this.text,
    this.textcolor,
    this.shape,
  });
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Color? background;
  final String text;
  final Color? textcolor;
  final dynamic shape;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height ?? screenHeight * 0.05,
      width: width ?? screenWidth * 0.3,
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            side: WidgetStateProperty.all(BorderSide(color: AppColor.primary)),
            // shape: WidgetStateProperty.all(RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(45),
            // )),
            backgroundColor:
                WidgetStateProperty.all(background ?? AppColor.primary)),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: textcolor ?? AppColor.background, fontSize: 18),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
