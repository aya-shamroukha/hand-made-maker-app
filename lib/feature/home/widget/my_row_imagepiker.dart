import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/app_color.dart';
import '../../../share/sized_box.dart';

class CoustomRow extends StatelessWidget {
  const CoustomRow({
    super.key,
    required this.icon,
    required this.string,
    this.ontap,
  });
  final IconData icon;
  final String string;

  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColor.primary,
              size: 20.sp,
            ),
            SizedBox_width(
              width: 15.w,
            ),
            Text(string,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColor.blodbrownText)),
          ],
        ),
      ),
    );
  }
}
