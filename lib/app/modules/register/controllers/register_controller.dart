import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midtrans_test/app/data/model/register_input.dart';
import 'package:midtrans_test/app/data/services/auth_services.dart';
import 'package:midtrans_test/app/data/services/preferences_service.dart';
import 'package:midtrans_test/app/global/constant/colors.dart';
import 'package:midtrans_test/app/global/controller/app_controller.dart';
import 'package:midtrans_test/app/global/widget/button.dart';
import 'package:midtrans_test/app/global/widget/loading_dialog.dart';
import 'package:midtrans_test/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final hidePassword = true.obs;

  final hidePassword2 = true.obs;

  @override
  void onClose() {
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    password2Controller.dispose();
    super.onClose();
  }

  void onRegister() async {
    if (formKey.currentState!.validate()) {
      LoadingDialog.basic();
      final result = await AuthServices.doRegister(
          data: RegisterInput(
              email: emailController.text,
              fullName: fullNameController.text,
              password: passwordController.text,
              phone: phoneController.text));
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
