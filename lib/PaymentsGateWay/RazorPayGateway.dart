import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class PaymentConroller extends GetxController{

  late Razorpay razorpay;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    razorpay.clear();
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar('Payment Success',
        response.orderId! + "\n" + response.paymentId! + "\n"+response.signature!);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar('Payment Error Occured', response.message!);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {

    Get.snackbar('External Wallet Successfull', response.walletName!);
  }

  void dispatchPayment(int amount,String contact,String description,String email,
      String wallet,String name){
    var options = {
      'key': 'rzp_test_zcS46fWIcvg9OY',
      'amount': amount,
      'name': name,
      'description': description,
      'prefill': {'contact': contact, 'email': email},
      'external': {
        'wallets': [wallet]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

}