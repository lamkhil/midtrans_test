import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/auth_services.dart';
import '../../../routes/app_pages.dart';
import 'tab/beranda_controller.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  final _currentTab = 0.obs;
  int get currentTab => _currentTab.value;
  final taboffset = (0.0).obs;
  late StreamSubscription onMessage;

  final berandaController = Get.put(BerandaController());
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      _currentTab.value = tabController.index;
    });
    tabController.animation!.addListener(() {
      taboffset.value = tabController.offset;
    });

    FirebaseMessaging.instance
        .getToken()
        .then((value) => AuthServices.sendFCMToken(value ?? ''));
    onMessage = FirebaseMessaging.onMessage.listen((event) {
      if (Get.currentRoute != Routes.HOME) {
        while (Get.currentRoute != Routes.HOME) {
          Get.back();
        }
      }
      berandaController.getSaldo();
    });

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    onMessage.cancel();
    Get.delete<BerandaController>();
    super.onClose();
  }
}
