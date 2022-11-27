import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tab/beranda_controller.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  final _currentTab = 0.obs;
  int get currentTab => _currentTab.value;
  final taboffset = (0.0).obs;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      _currentTab.value = tabController.index;
    });
    tabController.animation!.addListener(() {
      taboffset.value = tabController.offset;
    });

    Get.put(BerandaController());
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    Get.delete<BerandaController>();
    super.onClose();
  }
}
