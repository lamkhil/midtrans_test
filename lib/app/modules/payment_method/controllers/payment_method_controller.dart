import 'package:get/get.dart';
import 'package:midtrans_test/app/data/model/payment_model.dart';
import 'package:midtrans_test/app/data/services/payment_service.dart';
import 'package:midtrans_test/app/global/widget/loading_dialog.dart';
import 'package:midtrans_test/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentMethodController extends GetxController {
  final nominal = Get.arguments;

  final indexPayment = (-1).obs;

  List<Payment> paymentMethod = [
    Payment(
        image: 'assets/bri.webp',
        name: "BRI Virtual Account",
        code: 'bri',
        category: 'bank_transfer'),
    Payment(
        image: 'assets/bca.webp',
        name: "BCA Virtual Account",
        code: 'bca',
        category: 'bank_transfer'),
    Payment(
        image: 'assets/shopeepay.png',
        name: "Shopee Pay",
        code: 'shopeepay',
        category: 'shopeepay'),
    Payment(
        image: 'assets/gopay.png',
        name: "GoPay",
        code: 'gopay',
        category: 'gopay')
  ];

  void doTopUp() async {
    if (indexPayment.value > -1) {
      LoadingDialog.basic();
      final result = await PaymentService.doTopUp(
          paymentMethod[indexPayment.value], nominal);
      Get.back();
      if (result.bankTransfer != null) {
        Get.offNamed(Routes.BANK_TRANSFER_VA, arguments: result);
      } else if (result.ewalletModel != null) {
        final launc = await launchUrl(
            Uri.parse(result.ewalletModel!.actions!
                .where((element) => element.name == "deeplink-redirect")
                .first
                .url!),
            mode: LaunchMode.externalApplication);
      } else
        print("Tidak ada aksi");
    }
  }
}
