import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:midtrans_test/app/modules/home/controllers/home_controller.dart';

class HistoryPage extends GetView<HomeController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(24.r),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Namaku saya",
                        style: Get.textTheme.headline3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "Saldo e-Wallet",
                    style: Get.textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "Rp. 2.000",
                    style: Get.textTheme.headline1,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
