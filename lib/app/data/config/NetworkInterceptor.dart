import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:midtrans_test/app/data/config/NetworkInterceptorHelper.dart';
import 'package:midtrans_test/app/data/services/preferences_service.dart';

class NetworkInterceptor extends Interceptor {
  NetworkInterceptor();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("token ${PreferenceService.instance.getAccessToken()}");
    if (PreferenceService.instance.getAccessToken() != null) {
      options.headers.addAll({
        "Authorization":
            "Bearer ${PreferenceService.instance.getAccessToken()}",
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (response.data['message'] == "Unauthenticated.") {
      NetworkInterceptorHelper.goToLogout();
    }
    return super.onResponse(response, handler);
  }
}
