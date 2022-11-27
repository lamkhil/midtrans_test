import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:midpay/midpay.dart';
import 'package:midtrans_test/app/global/binding/app_binding.dart';
import 'package:midtrans_test/app/global/constant/theme.dart';
import 'package:midtrans_test/firebase_options.dart';

import 'app/data/services/preferences_service.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceService.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: "Application",
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.themeLigth,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          initialBinding: AppBinding(),
        );
      },
    );
  }
}
