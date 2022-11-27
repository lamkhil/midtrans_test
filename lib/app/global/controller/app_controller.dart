import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:midtrans_test/app/data/model/user_model.dart';

import '../../data/config/LoggingInterceptors.dart';
import '../../data/config/NetworkInterceptor.dart';

class AppController extends GetxController {
  late Dio dio;

  final user = Rx<User?>(null);

  @override
  void onInit() {
    final options = BaseOptions(
        baseUrl: "https://midtrans.takhruj.com/api",
        connectTimeout: 30000,
        receiveTimeout: 30000,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        });
    dio = Dio(options);
    dio.interceptors.add(NetworkInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(LoggingInterceptors());
    }
    super.onInit();
  }
}
