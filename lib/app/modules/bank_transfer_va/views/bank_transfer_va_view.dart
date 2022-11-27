import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:midtrans_test/app/global/constant/colors.dart';
import 'package:midtrans_test/app/global/widget/button.dart';

import '../controllers/bank_transfer_va_controller.dart';

class BankTransferVaView extends GetView<BankTransferVaController> {
  const BankTransferVaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${controller.argument.bankTransfer!.vaNumbers![0].bank!.toUpperCase()} Virtual Account'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Nomor VA ${controller.argument.bankTransfer!.vaNumbers![0].bank!.toUpperCase()}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              controller.argument.bankTransfer!.vaNumbers![0].vaNumber!,
              style: const TextStyle(fontSize: 20),
            ),
            Button.color(
                color: ColorsApp.primary,
                onPressed: () async {
                  print(
                      controller.argument.bankTransfer!.vaNumbers![0].vaNumber);
                  await Clipboard.setData(ClipboardData(
                      text: controller
                          .argument.bankTransfer!.vaNumbers![0].vaNumber));
                  Get.snackbar("Berhasil", "Nomor VA Berhasil disalin",
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: const Text("Salin"))
          ],
        ),
      ),
    );
  }
}
