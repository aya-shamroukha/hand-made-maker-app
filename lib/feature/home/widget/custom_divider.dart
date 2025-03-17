import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 30.w,
      endIndent: 30.w,
      color: AppColor.brownText,
      thickness: 0.3,
    );
  }
}
