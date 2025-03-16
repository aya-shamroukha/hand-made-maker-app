import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerBody extends StatelessWidget {
  const ShimmerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //color: AppColor.white,
        height: 60.h,
        width: 50.w,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(100)),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60.h,
            width: 50.w,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(100)),
          ),
        ),
      ),
    );
  }
}

class ShimmerBodyForImage extends StatelessWidget {
  const ShimmerBodyForImage({
    super.key,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
