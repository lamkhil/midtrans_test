import 'package:get/get.dart';
import 'package:midtrans_test/app/data/services/preferences_service.dart';
import 'package:midtrans_test/app/global/controller/app_controller.dart';
import 'package:midtrans_test/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      final user = PreferenceService.instance.getUser();
      if (user != null) {
        Get.find<AppController>().user.value = user;
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    });
    super.onReady();
  }
}
