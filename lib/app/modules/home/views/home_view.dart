import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:midtrans_test/app/global/constant/colors.dart';
import 'package:midtrans_test/app/modules/home/views/tab/beranda.dart';
import 'package:midtrans_test/app/modules/home/views/tab/history.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsApp.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: Image.asset(
            'assets/logo_text.png',
            width: 100.w,
          ),
          centerTitle: true,
          bottom: TabBar(
              controller: controller.tabController,
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              indicator: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: ColorsApp.backgroundColor,
              ),
              labelColor: const Color(0xFF03486F),
              unselectedLabelColor: ColorsApp.backgroundColor,
              tabs: const [
                Tab(
                  text: "Beranda",
                ),
                Tab(
                  text: "History",
                ),
              ]),
        ),
        body: TabBarView(
            controller: controller.tabController,
            children: const [BerandaPage(), HistoryPage()]));
  }
}
