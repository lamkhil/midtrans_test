import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:midtrans_test/app/global/constant/colors.dart';
import 'package:midtrans_test/app/global/utils/formatter.dart';
import 'package:midtrans_test/app/global/widget/button.dart';
import 'package:midtrans_test/app/modules/home/controllers/tab/beranda_controller.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class BerandaPage extends GetView<BerandaController> {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.getSaldo();
      },
      child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                child:
                                    controller.appController.user.value!.foto !=
                                            null
                                        ? Image.network(controller
                                            .appController.user.value!.foto!)
                                        : const Icon(IconlyBold.profile),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Obx(
                                () => Text(
                                  controller.appController.user.value!.name,
                                  style: Get.textTheme.headline3,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () => controller.onLogOut(),
                                  icon: const Icon(
                                    IconlyBroken.logout,
                                    color: ColorsApp.primary,
                                  ))
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
                          controller.obx(
                            (state) => Text(
                              "Rp. ${currencyFormatter.format(state)}",
                              style: Get.textTheme.headline1,
                            ),
                            onLoading: Text(
                              "Loading...",
                              style: Get.textTheme.headline1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                shortcutButton(context),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Nominal',
                  style:
                      Get.textTheme.bodyText1!.copyWith(color: ColorsApp.grey),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Form(
                  key: controller.formKey,
                  child: TextFormField(
                    controller: controller.nominalController,
                    style: Get.textTheme.headline1,
                    inputFormatters: [
                      ThousandsFormatter(formatter: currencyFormatter)
                    ],
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value != null) {
                        if ((int.tryParse(value.replaceAll('.', "")) ?? 0) <
                            10000) {
                          return "Minimal top up Rp 10.000";
                        }
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Rp",
                            style: Get.textTheme.headline1,
                          ),
                        ],
                      ),
                      prefixStyle: Get.textTheme.headline1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Button.basic(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    controller.onTopUp();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Top Up",
                        style: Get.textTheme.headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Column shortcutButton(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(4),
              child: Button.color(
                  onPressed: () {
                    controller.nominalController.text =
                        currencyFormatter.format(50000);
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "50ribu",
                      style: Get.textTheme.headline1,
                    ),
                  )),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(4),
              child: Button.color(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    controller.nominalController.text =
                        currencyFormatter.format(100000);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "100ribu",
                      style: Get.textTheme.headline1,
                    ),
                  )),
            )),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(4),
              child: Button.color(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    controller.nominalController.text =
                        currencyFormatter.format(200000);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "200ribu",
                      style: Get.textTheme.headline1,
                    ),
                  )),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(4),
              child: Button.color(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    controller.nominalController.text =
                        currencyFormatter.format(300000);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "300ribu",
                      style: Get.textTheme.headline1,
                    ),
                  )),
            )),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(4),
              child: Button.color(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    controller.nominalController.text =
                        currencyFormatter.format(500000);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "500ribu",
                      style: Get.textTheme.headline1,
                    ),
                  )),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(4),
              child: Button.color(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    controller.nominalController.text =
                        currencyFormatter.format(1000000);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "1juta",
                      style: Get.textTheme.headline1,
                    ),
                  )),
            )),
          ],
        ),
      ],
    );
  }
}
