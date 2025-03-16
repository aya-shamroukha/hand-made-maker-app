import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hand_made_maker/core/resources/app_font.dart';

import '../../resources/app_color.dart';


ThemeData appTheme = ThemeData(
    //brightness: Brightness.dark,
    primaryColor: AppColor.primary,

//  appBarTheme:  AppBarTheme(
//   backgroundColor: AppColor.background,
//   centerTitle: false,

//  iconTheme: IconThemeData(color: AppColor.white),
//   titleTextStyle:
//   TextStyle(fontSize: 24,color: AppColor.textColor,fontWeight: FontWeight.normal),
// elevation: 0,

//   ),
    // floatingActionButtonTheme:  FloatingActionButtonThemeData(
    //   shape: CircleBorder(),
    //   backgroundColor: AppColor.primary),
    scaffoldBackgroundColor: AppColor.background,
    drawerTheme: DrawerThemeData(backgroundColor: AppColor.background),
    textTheme: TextTheme(
      displayLarge: boldStyle(),
      displayMedium: normalStyle(),
      displaySmall: smallStyle(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          textStyle: TextStyle(color: AppColor.white, fontSize: 30.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      border: InputBorder.none,
      labelStyle: TextStyle(fontSize: 15.sp, color: AppColor.blodbrownText),
      fillColor: AppColor.background,
      outlineBorder: BorderSide(color: AppColor.primary),
      activeIndicatorBorder: BorderSide(color: AppColor.primary),
      focusColor: AppColor.primary,
      enabledBorder: UnderlineInputBorder(
          //  borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.primary)),
      errorBorder: UnderlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.primary)),
      focusedBorder: UnderlineInputBorder(
          //  borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.primary)),
      hintStyle: TextStyle(fontSize: 13.sp, color: AppColor.blodbrownText),
    ));
