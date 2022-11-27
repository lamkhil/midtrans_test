import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:midtrans_test/app/global/constant/gradient.dart';

import '../constant/colors.dart';

class Button {
  Button._();

  static Widget basic(
      {required void Function()? onPressed,
      required Widget child,
      double? elevation}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: elevation,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent),
        onPressed: onPressed,
        child: Container(
            height: 57.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                gradient: GradientsApp.primary),
            child: child));
  }

  static Widget outlined(
      {required void Function()? onPressed,
      required Widget child,
      double? elevation}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: elevation,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent),
        onPressed: onPressed,
        child: Container(
            height: 57.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: ColorsApp.backgroundColor,
                border: Border.all(color: ColorsApp.grey.withOpacity(0.2))),
            child: child));
  }

  static Widget color(
      {required void Function()? onPressed,
      required Widget child,
      Color color = Colors.white,
      double? elevation}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: elevation,
            padding: EdgeInsets.zero,
            backgroundColor: color),
        onPressed: onPressed,
        child: child);
  }
}
