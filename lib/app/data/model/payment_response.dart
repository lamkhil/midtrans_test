import 'package:midtrans_test/app/data/model/bank_transfer_model.dart';
import 'package:midtrans_test/app/data/model/ewallet_model.dart';

class PaymentResponse {
  int code;
  String message;
  BankTransfer? bankTransfer;
  Ewallet? ewalletModel;

  PaymentResponse(
      {required this.code,
      required this.message,
      this.bankTransfer,
      this.ewalletModel});

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
        code: json['code'],
        message: json['message'].toString(),
        bankTransfer: json['result'] != null
            ? json['result']['payment_type'] == "bank_transfer"
                ? BankTransfer.fromJson(json['result'])
                : null
            : null,
        ewalletModel: json['result'] != null
            ? json['result']['payment_type'] == "bank_transfer"
                ? null
                : Ewallet.fromJson(json['result'])
            : null);
  }
}
