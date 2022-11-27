import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../global/constant/colors.dart';
import '../../../global/widget/background_apps.dart';
import '../../../global/widget/button.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BackgroundApps(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: Get.height * 0.3,
                    width: Get.width,
                    color: ColorsApp.backgroundColor,
                  )),
              Positioned.fill(
                  child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 26.h,
                        margin: EdgeInsets.symmetric(vertical: 36.h),
                        child: Image.asset('assets/logo_text.png'),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: ScreenUtil().screenWidth,
                        decoration: BoxDecoration(
                            color: ColorsApp.backgroundColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r))),
                        child: Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 87.h,
                                ),
                                Text('Create new account',
                                    style: Get.textTheme.headline1),
                                SizedBox(
                                  height: 26.h,
                                ),
                                fullNameInput(),
                                SizedBox(
                                  height: 8.h,
                                ),
                                phoneInput(),
                                SizedBox(
                                  height: 8.h,
                                ),
                                emailInput(),
                                SizedBox(
                                  height: 8.h,
                                ),
                                passwordInput(),
                                SizedBox(
                                  height: 8.h,
                                ),
                                password2Input(),
                                SizedBox(
                                  height: 16.h,
                                ),
                                registerButton(),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "have a account?",
                                      style: Get.textTheme.subtitle1!
                                          .copyWith(color: ColorsApp.grey),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8,
                                            right: 8,
                                            bottom: 8,
                                            left: 4),
                                        child: Text(
                                          "Sign In",
                                          style: Get.textTheme.headline5!,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          )),
    );
  }

  Widget registerButton() {
    return Button.basic(
      onPressed: () {
        controller.onRegister();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Register",
            style: Get.textTheme.headline5!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Obx password2Input() {
    return Obx(() => TextFormField(
          controller: controller.password2Controller,
          obscureText: controller.hidePassword2.value,
          validator: (value) {
            if (value != null) {
              if (value != controller.passwordController.text) {
                return "Password tidak sama";
              }
            }
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(
              IconlyBold.lock,
            ),
            hintText: "Password Again",
            suffixIcon: IconButton(
                onPressed: () {
                  controller.hidePassword2.value =
                      !controller.hidePassword2.value;
                },
                icon: Icon(controller.hidePassword2.value
                    ? IconlyBold.show
                    : IconlyBold.hide)),
          ),
        ));
  }

  Obx passwordInput() {
    return Obx(
      () => TextFormField(
        controller: controller.passwordController,
        obscureText: controller.hidePassword.value,
        validator: (value) {
          if (value != null) {
            if (value.length < 6) {
              return "Minimal 6 karakter";
            }
          }
        },
        decoration: InputDecoration(
            prefixIcon: const Icon(
              IconlyBold.lock,
            ),
            hintText: "Password",
            suffixIcon: IconButton(
                onPressed: () {
                  controller.hidePassword.value =
                      !controller.hidePassword.value;
                },
                icon: Icon(controller.hidePassword.value
                    ? IconlyBold.show
                    : IconlyBold.hide))),
      ),
    );
  }

  TextFormField fullNameInput() {
    return TextFormField(
      controller: controller.fullNameController,
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Nama tidak boleh kosong";
          }
        }
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(
          IconlyBold.profile,
        ),
        hintText: "Full Name",
      ),
    );
  }

  TextFormField phoneInput() {
    return TextFormField(
      controller: controller.phoneController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Phone tidak boleh kosong";
          }
        }
        return null;
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(
          IconlyBold.call,
        ),
        hintText: "Phone",
      ),
    );
  }

  TextFormField emailInput() {
    return TextFormField(
      controller: controller.emailController,
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Email tidak boleh kosong";
          }
          if (!GetUtils.isEmail(value)) {
            return "Email tidak valid";
          }
        }
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(
          IconlyBold.message,
        ),
        hintText: "Your Email",
      ),
    );
  }
}
