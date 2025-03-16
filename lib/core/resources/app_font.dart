import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';


TextStyle textStyle(
    {required Color color,
    required double fontsize,
    required FontWeight fontWeight}) {
  return GoogleFonts.merriweather(
      color: color, fontSize: fontsize.sp, fontWeight: fontWeight);
}

//bold style
TextStyle boldStyle({
  Color? color,
  double fontsize = 25,
}) =>
    textStyle(
        color: color ?? AppColor.primary,
        fontsize: fontsize.sp,
        fontWeight: FontWeight.bold);
//regular style
TextStyle smallStyle({
  Color? color,
  double fontsize = 15,
}) =>
    textStyle(
        color: color ?? AppColor.brownText,
        fontsize: fontsize.sp,
        fontWeight: FontWeight.normal);
//normal Style
TextStyle normalStyle({
  Color? color,
  double fontsize = 17,
  FontWeight fontweight = FontWeight.w300,
}) =>
    textStyle(
        color: color ?? AppColor.brown,
        fontsize: fontsize.sp,
        fontWeight: fontweight);
