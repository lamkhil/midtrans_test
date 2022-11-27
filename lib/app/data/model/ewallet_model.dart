class Ewallet {
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
  String? fraudStatus;
  List<Actions>? actions;

  Ewallet(
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
      this.fraudStatus,
      this.actions});

  Ewallet.fromJson(Map<String, dynamic> json) {
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
    fraudStatus = json['fraud_status'];
    if (json['actions'] != null) {
      actions = <Actions>[];
      json['actions'].forEach((v) {
        actions?.add(Actions.fromJson(v));
      });
    }
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
    data['fraud_status'] = fraudStatus;
    if (actions != null) {
      data['actions'] = actions?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Actions {
  String? name;
  String? method;
  String? url;

  Actions({this.name, this.method, this.url});

  Actions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    method = json['method'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['method'] = method;
    data['url'] = url;
    return data;
  }
}
