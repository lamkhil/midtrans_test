import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:midpay/midpay.dart';
import 'package:midtrans_test/app/data/services/auth_services.dart';
import 'package:midtrans_test/app/global/controller/app_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../global/constant/colors.dart';
import '../../../../global/widget/button.dart';
import '../../../../routes/app_pages.dart';

class BerandaController extends GetxController with StateMixin<int> {
  TextEditingController nominalController = TextEditingController(text: "0");
  final appController = Get.find<AppController>();
  final formKey = GlobalKey<FormState>();
  late StreamSubscription onMessage;

  @override
  void onInit() {
    getSaldo();
    FirebaseMessaging.instance
        .getToken()
        .then((value) => AuthServices.sendFCMToken(value ?? ''));
    onMessage = FirebaseMessaging.onMessage.listen((event) {
      //delete soon
      Get.offAllNamed(Routes.HOME);
    });
    super.onInit();
  }

  @override
  void onClose() {
    nominalController.dispose();
    onMessage.cancel();
    super.onClose();
  }

  getSaldo() {
    change(null, status: RxStatus.loading());
    AuthServices.getSaldo()
        .then((value) => change(value, status: RxStatus.success()));
  }

  void onLogOut() {
    Get.dialog(AlertDialog(
      content: Text(
        "Apakah anda yakin ingin keluar?",
        style: Get.textTheme.bodyText1,
      ),
      actions: [
        Button.color(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Tidak",
              style: Get.textTheme.headline5,
            )),
        Button.color(
            color: ColorsApp.primary,
            onPressed: () {
              Get.back();
              Get.offAllNamed(Routes.LOGIN);
            },
            child: Text(
              "Iya",
              style: Get.textTheme.headline5!.copyWith(color: Colors.white),
            ))
      ],
    ));
  }

  Future<void> onTopUp() async {
    if (formKey.currentState!.validate()) {
      Get.toNamed(Routes.PAYMENT_METHOD,
          arguments:
              int.tryParse(nominalController.text.replaceAll(".", "")) ?? 0);
    }
  }

//calback
  Future<void> callback(TransactionFinished finished) async {
    print("Finish $finished");
  }
}
