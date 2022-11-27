import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:midtrans_test/app/global/constant/colors.dart';
import 'package:midtrans_test/app/global/widget/background_apps.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/widget/button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
                                Text('Sign in to continue',
                                    style: Get.textTheme.headline1),
                                SizedBox(
                                  height: 26.h,
                                ),
                                emailInput(),
                                SizedBox(
                                  height: 8.h,
                                ),
                                passwordInput(),
                                SizedBox(
                                  height: 16.h,
                                ),
                                signInButton(),
                                SizedBox(
                                  height: 16.h,
                                ),
                                orSpace(),
                                SizedBox(
                                  height: 16.h,
                                ),
                                googleLogin(),
                                SizedBox(
                                  height: 16.h,
                                ),
                                forgotPassword(),
                                register()
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

  Row register() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have a account?",
          style: Get.textTheme.subtitle1!.copyWith(color: ColorsApp.grey),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.REGISTER);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Register",
              style: Get.textTheme.headline5!,
            ),
          ),
        ),
      ],
    );
  }

  Row forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Forgot Password?",
              style: Get.textTheme.headline5!,
            ),
          ),
        ),
      ],
    );
  }

  Widget googleLogin() {
    return Button.outlined(
        onPressed: () {},
        elevation: 0,
        child: Stack(
          children: [
            Positioned.directional(
              start: 16.w,
              top: 16.h,
              textDirection: TextDirection.ltr,
              child: SizedBox(
                width: 24.h,
                child: Image.asset(
                  'assets/Google.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Login with Google",
                style: Get.textTheme.headline5!.copyWith(color: Colors.grey),
              ),
            )
          ],
        ));
  }

  Row orSpace() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            "OR",
            style: Get.textTheme.headline4!.copyWith(color: ColorsApp.grey),
          ),
        ),
        const Expanded(child: Divider())
      ],
    );
  }

  Widget signInButton() {
    return Button.basic(
      onPressed: () {
        controller.doLogin();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign In",
            style: Get.textTheme.headline5!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Obx passwordInput() {
    return Obx(
      () => TextFormField(
        controller: controller.passwordController,
        obscureText: controller.hidePassword.value,
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
