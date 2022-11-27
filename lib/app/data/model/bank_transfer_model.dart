class BankTransfer {
  String? statusCode;
  String? statusMessage;
  String? transactionId;
  String? orderId;
  String? merchantId;
  String? grossAmount;
  String? currency;
  String? paymentType;
  String? transactionTime;
  String? transactionStatus;
  List<VaNumbers>? vaNumbers;
  String? fraudStatus;

  BankTransfer(
      {this.statusCode,
      this.statusMessage,
      this.transactionId,
      this.orderId,
      this.merchantId,
      this.grossAmount,
      this.currency,
      this.paymentType,
      this.transactionTime,
      this.transactionStatus,
      this.vaNumbers,
      this.fraudStatus});

  BankTransfer.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    transactionId = json['transaction_id'];
    orderId = json['order_id'];
    merchantId = json['merchant_id'];
    grossAmount = json['gross_amount'];
    currency = json['currency'];
    paymentType = json['payment_type'];
    transactionTime = json['transaction_time'];
    transactionStatus = json['transaction_status'];
    if (json['va_numbers'] != null) {
      vaNumbers = <VaNumbers>[];
      json['va_numbers'].forEach((v) {
        vaNumbers?.add(VaNumbers.fromJson(v));
      });
    }
    fraudStatus = json['fraud_status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['status_message'] = statusMessage;
    data['transaction_id'] = transactionId;
    data['order_id'] = orderId;
    data['merchant_id'] = merchantId;
    data['gross_amount'] = grossAmount;
    data['currency'] = currency;
    data['payment_type'] = paymentType;
    data['transaction_time'] = transactionTime;
    data['transaction_status'] = transactionStatus;
    if (vaNumbers != null) {
      data['va_numbers'] = vaNumbers?.map((v) => v.toJson()).toList();
    }
    data['fraud_status'] = fraudStatus;
    return data;
  }
}

class VaNumbers {
  String? bank;
  String? vaNumber;

  VaNumbers({this.bank, this.vaNumber});

  VaNumbers.fromJson(Map<String, dynamic> json) {
    bank = json['bank'];
    vaNumber = json['va_number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bank'] = bank;
    data['va_number'] = vaNumber;
    return data;
  }
}
