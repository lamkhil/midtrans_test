import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midtrans_test/app/global/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeApp {
  ThemeApp._();

  static final themeLigth = ThemeData(
      primaryColor: ColorsApp.primary,
      colorScheme: const ColorScheme.light(primary: ColorsApp.primary2),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          hintStyle: Get.textTheme.subtitle1!
              .copyWith(color: ColorsApp.grey, fontWeight: FontWeight.w100),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(color: ColorsApp.grey.withOpacity(0.2))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(color: ColorsApp.grey.withOpacity(0.2))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide:
                  BorderSide(color: ColorsApp.primary2.withOpacity(0.2))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(color: ColorsApp.red.withOpacity(0.2)))),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorsApp.darkBlue),
        headline2: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: ColorsApp.darkBlue),
        headline3: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: ColorsApp.darkBlue),
        headline4: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: ColorsApp.darkBlue),
        headline5: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: ColorsApp.darkBlue),
        headline6: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: ColorsApp.darkBlue),
        bodyText1: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
        bodyText2: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
        subtitle1: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w100),
      ));
}
