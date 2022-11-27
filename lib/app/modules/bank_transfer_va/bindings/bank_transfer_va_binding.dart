import 'package:get/get.dart';

import '../controllers/bank_transfer_va_controller.dart';

class BankTransferVaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BankTransferVaController>(
      () => BankTransferVaController(),
    );
  }
}
