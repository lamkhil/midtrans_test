import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:midtrans_test/app/global/constant/colors.dart';
import 'package:midtrans_test/app/global/widget/background_apps.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BackgroundApps(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    midtransLogo(),
                    const SizedBox(
                      height: 12,
                    ),
                    subtitleText("Flutter Integration\nby Lamkhil")
                  ],
                )),
            Positioned(
                bottom: 36.h,
                child: SpinKitWave(
                  color: Colors.white,
                  size: 24.sp,
                ))
          ],
        ),
      ),
    );
  }

  Text subtitleText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Get.textTheme.headline4!
          .copyWith(color: Colors.white, fontWeight: FontWeight.w300),
    );
  }

  Container midtransLogo() {
    return Container(
      padding: EdgeInsets.all(12.sp),
      margin: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            const BoxShadow(
                color: ColorsApp.blue, offset: Offset(3, 3), blurRadius: 2),
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(6, 6),
                blurRadius: 2)
          ],
          color: Colors.white),
      child: Image.asset(
        'assets/midtrans-logo.png',
        height: 60.h,
      ),
    );
  }
}
