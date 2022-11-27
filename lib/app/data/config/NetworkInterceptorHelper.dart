import 'package:get/get.dart';
import 'package:midtrans_test/app/data/services/preferences_service.dart';
import 'package:midtrans_test/app/routes/app_pages.dart';

class NetworkInterceptorHelper {
  static void goToLogout() {
    PreferenceService.instance.clear();
    Get.offAllNamed(Routes.LOGIN);
  }
}
