import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:midtrans_test/app/global/constant/colors.dart';
import 'package:midtrans_test/app/global/widget/button.dart';

import '../../../global/utils/formatter.dart';
import '../controllers/payment_method_controller.dart';

class PaymentMethodView extends GetView<PaymentMethodController> {
  const PaymentMethodView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembayaran',
          style: Get.textTheme.headline2!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w200),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(Get.width, 100.h),
          child: Container(
            width: Get.width,
            padding: EdgeInsets.all(24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Pembayaran",
                  style: Get.textTheme.headline2!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Rp ${currencyFormatter.format(controller.nominal)}",
                  style: Get.textTheme.headline1!.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bayarnya pakai apa?",
                style: Get.textTheme.headline1,
              ),
              SizedBox(
                height: 24.h,
              ),
              ListView.builder(
                  itemCount: controller.paymentMethod.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        if (index == controller.indexPayment.value) {
                          controller.indexPayment.value = -1;
                        } else {
                          controller.indexPayment.value = index;
                        }
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorsApp.backgroundColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                      controller.paymentMethod[index].image),
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                controller.paymentMethod[index].name,
                                style: Get.textTheme.headline3,
                              ),
                              const Spacer(),
                              Obx(
                                () => Container(
                                  padding: EdgeInsets.all(16.r),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          controller.indexPayment.value == index
                                              ? ColorsApp.primary
                                              : null,
                                      border: controller.indexPayment.value !=
                                              index
                                          ? Border.all(color: ColorsApp.primary)
                                          : null),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: (57 + 16).h,
        padding: const EdgeInsets.all(16),
        child: Button.basic(
          onPressed: () {
            controller.doTopUp();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lanjutkan Pembayaran",
                style: Get.textTheme.headline5!.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
