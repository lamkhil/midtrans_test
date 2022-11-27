import 'package:get/get.dart';

import '../bank_transfer_model.dart';

class BankTransferProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return BankTransfer.fromJson(map);
      if (map is List)
        return map.map((item) => BankTransfer.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<BankTransfer?> getBankTransfer(int id) async {
    final response = await get('banktransfer/$id');
    return response.body;
  }

  Future<Response<BankTransfer>> postBankTransfer(
          BankTransfer banktransfer) async =>
      await post('banktransfer', banktransfer);
  Future<Response> deleteBankTransfer(int id) async =>
      await delete('banktransfer/$id');
}
