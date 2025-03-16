import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/app_color.dart';
import '../../../share/sized_box.dart';

class Categoriescard extends StatelessWidget {
  const Categoriescard({
    super.key,
    required this.image,
    required this.ontap,
    required this.text,
  });
  final String image;
  final VoidCallback ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      height: 160.h,
      child: InkWell(
        onTap: ontap,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: AppColor.primary,
              ),
            ),
            color: AppColor.lightbrownText,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image),
                SizedBox_Height(height: 10.h),
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColor.labelcolor),
                )
              ],
            )),
      ),
    );
  }
}
