import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:midtrans_test/app/global/constant/colors.dart';

class LoadingDialog {
  LoadingDialog._();

  static void basic() {
    Get.dialog(Center(
      child: Container(
        height: 70.h,
        width: 70.w,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: ColorsApp.backgroundColor,
            borderRadius: BorderRadius.circular(12)),
        child: const SpinKitWave(
          color: ColorsApp.primary,
          size: 25,
        ),
      ),
    ));
  }
}
