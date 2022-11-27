import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midtrans_test/app/data/model/login_input.dart';

import '../../../data/services/auth_services.dart';
import '../../../data/services/preferences_service.dart';
import '../../../global/constant/colors.dart';
import '../../../global/controller/app_controller.dart';
import '../../../global/widget/button.dart';
import '../../../global/widget/loading_dialog.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final hidePassword = true.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void doLogin() async {
    if (formKey.currentState!.validate()) {
      LoadingDialog.basic();
      final result = await AuthServices.doLogin(
          data: LoginInput(
              email: emailController.text, password: passwordController.text));
      Get.back();

      if (result.success) {
        PreferenceService.instance.saveUser(result.user!);
        Get.find<AppController>().user.value = result.user!;
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.dialog(AlertDialog(
          title: Text(
            "Gagal",
            style: Get.textTheme.headline3,
          ),
          content: Text(
            result.message,
            style: Get.textTheme.bodyText1,
          ),
          actions: [
            Button.color(
                color: ColorsApp.primary,
                onPressed: () => Get.back(),
                child: Text(
                  "OK",
                  style: Get.textTheme.button!.copyWith(color: Colors.white),
                ))
          ],
        ));
      }
    }
  }
}
