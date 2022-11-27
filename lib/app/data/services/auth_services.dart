import 'dart:developer';

import 'package:get/get.dart';
import 'package:midtrans_test/app/data/model/auth_response.dart';
import 'package:midtrans_test/app/data/model/login_input.dart';
import 'package:midtrans_test/app/data/model/register_input.dart';
import 'package:midtrans_test/app/global/controller/app_controller.dart';

class AuthServices {
  AuthServices._();

  static const register = "/register";
  static const login = "/login";
  static const saldo = "/saldo";
  static const fcm = "/fcm";

  static final _dio = Get.find<AppController>().dio;

  static Future<AuthResponse> doRegister({required RegisterInput data}) async {
    try {
      final response = await _dio.post(register, data: data.toJson());
      return AuthResponse.fromJson(response.data);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      return AuthResponse(message: "Server Error", success: false, user: null);
    }
  }

  static Future<AuthResponse> doLogin({required LoginInput data}) async {
    try {
      final response = await _dio.post(login, data: data.toJson());
      return AuthResponse.fromJson(response.data);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      return AuthResponse(message: "Server Error", success: false, user: null);
    }
  }

  static Future<int> getSaldo() async {
    try {
      final response = await _dio.get(saldo);
      if (response.statusCode == 200) {
        return response.data['saldo'];
      }
      return 0;
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      return 0;
    }
  }

  static Future<void> sendFCMToken(String token) async {
    try {
      await _dio.post(fcm, data: {'fcm': token});
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
    }
  }
}
