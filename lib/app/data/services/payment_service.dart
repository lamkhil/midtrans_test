import 'dart:developer';

import 'package:get/get.dart';
import 'package:midtrans_test/app/data/model/payment_model.dart';
import 'package:midtrans_test/app/data/model/payment_response.dart';
import 'package:midtrans_test/app/global/controller/app_controller.dart';

class PaymentService {
  PaymentService._();

  static final dio = Get.find<AppController>().dio;

  static const topup = '/order/topup';

  static Future<PaymentResponse> doTopUp(Payment payment, int total) async {
    try {
      final result = await dio.post(topup, data: {
        "payment_method": payment.category,
        "total": total,
        "code": payment.code
      });
      return PaymentResponse.fromJson(result.data);
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return PaymentResponse(code: 0, message: "Gagal");
    }
  }
}
